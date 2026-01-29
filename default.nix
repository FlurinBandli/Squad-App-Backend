{
  pkgs ? import <nixpkgs> { },
}:
pkgs.buildNpmPackage {
  src = ./.;
  pname = "squad-app-backend-pipa";
  version = "0.0.1";
  npmDepsHash = "sha256-5Noq2GrLiRXWa7oaGYTWC788vcJjvOHfONdrUFW7VKA=";
}
