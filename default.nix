{
  pkgs ? import <nixpkgs> { },
}:
pkgs.buildNpmPackage {
  pname = "squad-app-backend-pipa";
  version = "0.0.1";
  src = fetchGit {
    url = ./.;
    rev = "dd453c74e9b58dc317123164cd6f9e26a746b385";
  };
  npmDepsHash = "sha256-OZDCqXW9YlGcuEgu9Qowzvg/sunmbEann2lw2FT0ukU=";
}
