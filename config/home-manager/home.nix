{ config, pkgs, ... }:

{
  home.username = "spin";
  home.homeDirectory = "/home/spin";
  home.stateVersion = "22.11";
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    pkgs.fzf
    pkgs.ripgrep
    pkgs.curl
    pkgs.git
    pkgs.jq
    pkgs.tmux
    pkgs.zsh
    pkgs.starship
    pkgs.bat
    pkgs.colorls
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.zsh = {
    autocd = true;
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;

    shellAliases = {
      sc = "systemctl";
      jc = "journalctl";
      cat = "bat";
      ls = "colorls --dark";
      vi = "nvim";
    };

    initExtra = ''
      command -v starship &> /dev/null && eval   "$(starship init zsh)"
      command -v tunnel   &> /dev/null && source <(tunnel completion zsh)
      [[ -f /opt/dev/dev.sh ]] && source /opt/dev/dev.sh
    '';
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      dracula-nvim
      nvim-treesitter
      (nvim-treesitter.withPlugins (p: [ p.nix p.ruby p.go p.yaml p.json p.typescript p.javascript]))
    ];

    extraConfig = ''
      syntax on  
      set expandtab
      set shiftwidth=2
      set tabstop=2
      set relativenumber
      colorscheme dracula
    '';
  };
  
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
  };
}
