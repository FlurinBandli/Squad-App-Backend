{
  pkgs ? import <nixpkgs> { },
}:
pkgs.buildNpmPackage {
  pname = "squad-app-backend-pipa";
  version = "0.0.1";
  src = fetchGit {
    url = ./.;
    rev = "9630a578e9963b9375666bce852231b40adc11c2";
  };
  npmDepsHash = "sha256-OZDCqXW9YlGcuEgu9Qowzvg/sunmbEann2lw2FT0ukU=";
}
