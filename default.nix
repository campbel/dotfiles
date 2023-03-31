with import <nixpkgs> {};

let
    dotfiles=pkgs.fetchgit {
        url = "https://github.com/campbel/dotfiles.git";
        rev = "fe0930d3cbd2bcc3109765672e13f342fcb95f93";
        sha256 = "cW5wTwkVMwjin6sjKRYA+TQgGVeVwkpFSTbvhoWez/4=";
    };
in

stdenv.mkDerivation {
    name = "campbel-shell";
    buildInputs = [
        jq
        go_1_20
        zsh
        starship
    ];
    shellHook = ''
        echo "Copying files from Git repository to home directory..."
        mkdir -p ~/.config
        cp -R ${dotfiles}/config/starship.toml ~/.config/starship.nix.toml
        echo "Files copied successfully!"
    '';
}

