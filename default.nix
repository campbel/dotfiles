with import <nixpkgs> {};

let
    dotfiles=pkgs.fetchgit {
        url = "https://github.com/campbel/dotfiles.git";
        rev = "8838ca5a5f41198039bc90a4407f008104cbf8e0";
        sha256 = "dUD5PbCWCnPfKfXGg52yh6Y1qsjDA7JeqmYK9d1fdCc=";
    };
in

stdenv.mkDerivation {
    name = "campbel-shell";
    buildInputs = [
        bat
        curl
        git
        jq
        go_1_20
        zsh
        starship
        vim
    ];
    shellHook = ''
        echo "Copying files from Git repository to home directory..."
        mkdir -p ~/.config
        cp ${dotfiles}/config/starship.nix.toml ~/.config/starship.toml
        cp ${dotfiles}/dotfiles/zshrc ~/.zshrc
        cp ${dotfiles}/dotfiles/zprofile ~/.zprofile
        echo "Files copied successfully!"
    '';
}

