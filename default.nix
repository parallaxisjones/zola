{ pkgs ? import <nixpkgs> { }, ... }:

pkgs.rustPlatform.buildRustPackage {
  pname = "myZola";
  version = "custom";

  src = pkgs.lib.cleanSource ./;  # Refers to 'crates/zola'

  cargoSha256 = "0000000000000000000000000000000000000000000000000000";  # Replace with correct hash

  nativeBuildInputs = [
    pkgs.openssl
    pkgs.pkgconfig
    pkgs.libgit2
    # Add any other dependencies required by Zola
  ];

  meta = with pkgs.lib; {
    description = "Your custom version of Zola";
    homepage = "https://www.getzola.org/";
    license = licenses.mit;
    maintainers = [ maintainers.yourGithubUsername ];
    platforms = platforms.all;
  };
}
