{
  pkgs ? import <nixpkgs> { },
  backend ? pkgs.callPackage ./backend.nix { },
}:
let
  makeInteractive =
    application:
    pkgs.writeShellScriptBin application.name ''
      ${pkgs.bashInteractive}/bin/bash --init-file ${application}/bin/${application.name}
    '';
in
makeInteractive (
  pkgs.writeShellApplication {
    name = "squad-app-backend-pipa";
    runtimeInputs = [
      pkgs.mariadb
      pkgs.nodejs
      backend
    ];
    runtimeEnv = {
      inherit backend;
      MYSQL_BASE_DIR = pkgs.mariadb;
      MYSQL_PORT = 3306;
    };
    bashOptions = [ ];
    excludeShellChecks = [
      "SC1091" # Incorrect sourcing of .env
      "SC2164" # Bad error handling
    ];

    text = ''
      # Export variables globally from .env
      set -a
      source ${./.env}
      set +a

      MYSQL_HOME="$PWD/mysql"

      [ ! -d "$MYSQL_HOME" ]
      INSTALL_MYSQL=$?

      MYSQL_DATA_DIR="$MYSQL_HOME/data"
      MYSQL_SOCKET_FILE="$MYSQL_HOME/mysql.sock"
      MYSQL_PID_FILE="$MYSQL_HOME/mysql.pid"
      MYSQL_INIT_FILE="$MYSQL_HOME/init.sql"

      mkdir -p "$MYSQL_HOME"
      touch "$MYSQL_INIT_FILE"
      echo "CREATE DATABASE IF NOT EXISTS \`$DATABASE_NAME\`;" > "$MYSQL_INIT_FILE"

      # Install database if doesn't exist
      if [ $INSTALL_MYSQL -eq 0 ]; then
        printf "installing database...\n"
        mariadb-install-db \
          --no-defaults \
          --auth-root-authentication-method=normal \
          --datadir="$MYSQL_DATA_DIR" \
          --basedir="$MYSQL_BASE_DIR" \
          --pid-file="$MYSQL_PID_FILE" \
          --extra-file="$MYSQL_INIT_FILE"
        printf "done installing database\n"
      fi

      function startDb() {
        if [ "$MYSQL_PID" ]; then
          echo "error: database is already running (PID $APP_PID). stop it with stopDb." >&2
          return
        fi
        printf "starting database...\n"
        mariadbd \
          --no-defaults \
          --port="$MYSQL_PORT" \
          --socket="$MYSQL_SOCKET_FILE" \
          --pid-file="$MYSQL_PID_FILE" \
          --datadir="$MYSQL_DATA_DIR" &
        MYSQL_PID=$!
        mariadb-admin ping --port="$MYSQL_PORT" --wait=1 > /dev/null
        printf "done starting database\n"
      }
      function stopDb() {
        if [ "$MYSQL_PID" ]; then
          printf "stopping database...\n"
          mariadb-admin shutdown -u root --socket="$MYSQL_SOCKET_FILE"
          wait "$MYSQL_PID"
          MYSQL_PID=
          printf "done stopping database\n"
        fi
      }

      function startApp() {
        if [ "$APP_PID" ]; then
          echo "error: app is already running (PID $APP_PID). stop it with stopApp." >&2
          return
        fi
        printf "starting app...\n"
        $backend/bin/squad-app-backend-pipa &
        APP_PID=$!
        printf "done starting app\n"
      }
      function stopApp() {
        if [ "$APP_PID" ]; then
          printf "stopping app...\n"
          kill "$APP_PID"
          wait "$APP_PID"
          APP_PID=
          printf "done stopping app\n"
        fi
      }

      function runMigration() {
        local prevPwd="$PWD"
        cd $backend/lib/node_modules/squad-app-backend-pipa
        npm run migration:run:prod
        cd "$prevPwd"
      }
      function generateMigration() {
        local prevPwd="$PWD"
        cd $backend/lib/node_modules/squad-app-backend-pipa
        npm run migration:generate:prod "$prevPwd/migrations/$1"
        cd "$prevPwd"
      }
      function revertMigration() {
        local prevPwd="$PWD"
        cd $backend/lib/node_modules/squad-app-backend-pipa
        npm run migration:revert:prod
        cd "$prevPwd"
      }

      startDb

      if [ "$INSTALL_MYSQL" -eq 0 ]; then
        printf "running migrations...\n"
        runMigration
        printf "done running migrations\n"
      fi

      startApp

      ps

      function onExit() {
        stopApp
        stopDb
      }
      trap onExit EXIT

      function onInterrupt() {
        stopApp
      }
      trap onInterrupt INT
    '';
  }
)
