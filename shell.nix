{
  pkgs ? import <nixpkgs> { },
  backend ? (pkgs.callPackage ./default.nix { }).overrideAttrs { npmFlags = [ "--include=dev" ]; },
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
    MYSQL_HOME="$PWD/mysql"
    MYSQL_DATA_DIR="$MYSQL_HOME/data"
    MYSQL_SOCKET_FILE="$MYSQL_HOME/mysql.sock"
    MYSQL_PID_FILE="$MYSQL_HOME/mysql.pid"

    if [ ! -d "$MYSQL_HOME" ]; then
      mariadb-install-db \
        --no-defaults \
        --auth-root-authentication-method=normal \
        --datadir="$MYSQL_DATA_DIR" \
        --basedir="$MYSQL_BASE_DIR" \
        --pid-file="$MYSQL_PID_FILE"  
    fi

    mariadbd \
      --no-defaults \
      --port="$MYSQL_PORT" \
      --socket="$MYSQL_SOCKET_FILE" \
      --pid-file="$MYSQL_PID_FILE" \
      --datadir="$MYSQL_DATA_DIR" &
    MYSQL_PID=$!
    mariadb-admin ping --port="$MYSQL_PORT" --wait=1

    squad-app-backend-pipa &
    BACKEND_PID=$!

    finish() {
      echo "MYSQL_PID=$MYSQL_PID"
      echo "BACKEND_PID=$BACKEND_PID"
      kill $BACKEND_PID
      mariadb-admin -u root --socket="$MYSQL_SOCKET_FILE" shutdown
      # kill $MYSQL_PID
      
      wait $BACKEND_PID
      wait $MYSQL_PID
    }
    trap finish EXIT
  '';
  #   shellHook = ''
  #     MYSQL_BASEDIR=${pkgs.mariadb}
  #     MYSQL_HOME="$PWD/mysql"
  #     MYSQL_DATADIR="$MYSQL_HOME/data"
  #     export MYSQL_UNIX_PORT="$MYSQL_HOME/mysql.sock"
  #     MYSQL_PID_FILE="$MYSQL_HOME/mysql.pid"
  #
  #     if [ ! -d "$MYSQL_HOME" ]; then
  #       mysql_install_db \
  #         --no-defaults \
  #         --auth-root-authentication-method=normal \
  #         --datadir="$MYSQL_DATADIR" \
  #         --basedir="$MYSQL_BASEDIR" \
  #         --pid-file="$MYSQL_PID_FILE"
  #     fi
  #
  #     mysqld \
  #       --no-defaults \
  #       --skip-networking \
  #       --socket="$MYSQL_UNIX_PORT" \
  #       --pid-file="$MYSQL_PID_FILE" \
  #       --datadir="$MYSQL_DATADIR" 2> "$MYSQL_HOME/mysql.log" &
  #     MYSQL_PID=$!
  #
  #     finish() {
  #       # mysqladmin -u root --socket="$MYSQL_UNIX_PORT" shutdown
  #       echo "MYSQL_PID=$MYSQL_PID"
  #       mariadb-admin -u root --socket="$MYSQL_UNIX_PORT" shutdown
  #       # kill $MYSQL_PID
  #       wait $MYSQL_PID
  #     }
  #     trap finish EXIT
  #   '';
}
