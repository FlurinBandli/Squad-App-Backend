{
  pkgs ? import <nixpkgs> { },
}:
pkgs.buildNpmPackage {
  pname = "squad-app-backend-pipa";
  version = "0.0.1";
  src = fetchGit {
    url = ./.;
    rev = "8b26e13e2c4c247015ec7e4bbd1ce34dc051609f";
  };
  npmDepsHash = "sha256-5Noq2GrLiRXWa7oaGYTWC788vcJjvOHfONdrUFW7VKA=";
}
