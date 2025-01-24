{
  description = "Custom version of Zola static site generator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = {
          default = pkgs.rustPlatform.buildRustPackage {
            pname = "myZola";
            version = "custom";

            src = self;

            cargoSha256 = "Bp/rPpuV7vZrqoAgvQ5+UptT2OdABkhaiTuUAjfFofY=";

            nativeBuildInputs = [
              pkgs.openssl
              pkgs.pkg-config
              pkgs.libgit2
              # Add other dependencies as required by Zola
            ];

            meta = with pkgs.lib; {
              description = "Your custom version of Zola";
              homepage = "https://www.getzola.org/";
              license = pkgs.lib.licenses.mit;
              # maintainers = with maintainers; [ yourGithubUsername ];
              platforms = pkgs.lib.platforms.all;
            };
          };
        };
      }
    );
}

