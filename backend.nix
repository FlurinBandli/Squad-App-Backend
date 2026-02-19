{
  pkgs ? import <nixpkgs> { },
}:
pkgs.buildNpmPackage {
  pname = "squad-app-backend-pipa_npm";
  version = "0.0.1";
  src = fetchGit {
    url = ./.;
    rev = "7e4bff177d3cc38ed27f6202b635dbe9a3878856";
  };
  npmDepsHash = "sha256-OZDCqXW9YlGcuEgu9Qowzvg/sunmbEann2lw2FT0ukU=";
}
