{
  pkgs ? import <nixpkgs> { },
  backend ? pkgs.callPackage ./default.nix { },
}:
pkgs.mkShell {
  inputsFrom = [ backend ];
  buildInputs = [
    pkgs.mariadb
    backend
  ];

  inherit backend;
  MYSQL_BASE_DIR = pkgs.mariadb;
  MYSQL_PORT = 3306;
  shellHook = ''
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

    mkdir -p $MYSQL_HOME
    touch $MYSQL_INIT_FILE
    echo "CREATE DATABASE IF NOT EXISTS \`$DATABASE_NAME\`;" > $MYSQL_INIT_FILE

    # Install database if doesn't exist
    if [ $INSTALL_MYSQL -eq 0 ]; then
      mariadb-install-db \
        --no-defaults \
        --auth-root-authentication-method=normal \
        --datadir="$MYSQL_DATA_DIR" \
        --basedir="$MYSQL_BASE_DIR" \
        --pid-file="$MYSQL_PID_FILE" \
        --extra-file="$MYSQL_INIT_FILE"
    fi

    function startDb() {
      if [ $MYSQL_PID ]; then
        echo "error: database is already running (PID $APP_PID). stop it with stopDb." >&2
        return
      fi
      mariadbd \
        --no-defaults \
        --port="$MYSQL_PORT" \
        --socket="$MYSQL_SOCKET_FILE" \
        --pid-file="$MYSQL_PID_FILE" \
        --datadir="$MYSQL_DATA_DIR" &
      MYSQL_PID=$!
      # Wait for database to be ready
      mariadb-admin ping --port="$MYSQL_PORT" --wait=1
    }
    function stopDb() {
      if [ $MYSQL_PID ]; then
        mariadb-admin shutdown -u root --socket="$MYSQL_SOCKET_FILE"
        wait $MYSQL_PID
        MYSQL_PID=
      fi
    }

    function startApp() {
      if [ $APP_PID ]; then
        echo "error: app is already running (PID $APP_PID). stop it with stopApp." >&2
        return
      fi
      squad-app-backend-pipa &
      APP_PID=$!
    }
    function stopApp() {
      if [ $APP_PID ]; then
        kill $APP_PID
        wait $APP_PID
        APP_PID=
      fi
    }

    function runMigration() {
      local prevPwd=$PWD
      cd $backend/lib/node_modules/squad-app-backend-pipa
      npm run migration:run:prod
      cd $prevPwd
    }
    function generateMigration() {
      local prevPwd=$PWD
      cd $backend/lib/node_modules/squad-app-backend-pipa
      npm run migration:generate:prod
      cd $prevPwd
    }
    function revertMigration() {
      local prevPwd=$PWD
      cd $backend/lib/node_modules/squad-app-backend-pipa
      npm run migration:revert:prod
      cd $prevPwd
    }

    startDb

    if [ $INSTALL_MYSQL -eq 0 ]; then
      runMigration
    fi

    startApp

    function onExit() {
      stopApp
      stopDb
    }
    trap onExit EXIT
    function onInterupt() {
      APP_PID=
    }
    trap onInterupt INT
  '';
}
