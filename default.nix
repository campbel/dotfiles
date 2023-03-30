let
    pkgs = import <nixpkgs> {};
    starship_config=pkgs.fetchgit {
        url = "https://github.com/campbel/dotfiles.git";
        rev "fe0930d3cbd2bcc3109765672e13f342fcb95f93";
    };

    stdenv.mkDerivation {
        name = "campbel-shell";
        buildInputs = [
            htop
            jq
            tree
            go_1_20
        ];
    }
in
    pkgs.runCommand "starship-config" {} ''
        mkdir -p $out/dotfiles
        cp ${starship_config} $out/dotfiles/starship_config
    ''
