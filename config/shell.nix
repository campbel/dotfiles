with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "campbel-shell";
  buildInputs = [
    htop
    jq
    tree
    go_1_20
  ];
}
