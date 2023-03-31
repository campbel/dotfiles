with import <nixpkgs> {};

let
    dotfiles=pkgs.fetchgit {
        url = "https://github.com/campbel/dotfiles.git";
        rev = "c30884c420e5dba6eba2637599d09fcb0ff1069b";
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

