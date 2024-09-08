{ pkgs, ... }: {
  home.file.".p10k.zsh".source = ./.p10k.zsh;
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = false;

  programs.zsh.plugins = [
    {
      name = "zsh-autosuggestions";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-autosuggestions";
        rev = "c3d4e576c9c86eac62884bd47c01f6faed043fc5";
        sha256 = "B+Kz3B7d97CM/3ztpQyVkE6EfMipVF8Y4HJNfSRXHtU=";
      };
    }
    {
      name = "zsh-autocomplete";
      src = pkgs.fetchFromGitHub {
        owner = "marlonrichert";
        repo = "zsh-autocomplete";
        rev = "196810035992abea65e54852c4278af2069ee482";
        sha256 = "bzOTeYWrzuYNbeat30zijKJ9kflRhdE/0wD2HwZWXbU=";
      };
    }
    {
      name = "auto-ls";
      src = pkgs.fetchFromGitHub {
        owner = "desyncr";
        repo = "auto-ls";
        rev = "a7a7e6c16407a3c4a46319f5f111a827468a0943";
        sha256 = "nLAdHI1y6lL95QKnNN8x5remKobLClnVY5Ia3TZXp5Y=";
      };
    }
    {
      name = "zsh-you-should-use";
      src = pkgs.fetchFromGitHub {
        owner = "MichaelAquilina";
        repo = "zsh-you-should-use";
        rev = "8e0548c0c2270c3ee422f350106e538d108c3f5b";
        sha256 = "fJX748lwVP1+GF/aIl1J3c6XAy/AtYCpEHsP8weUNo0=";
      };
    }
    {
      name = "zsh-vi-mode";
      src = pkgs.fetchFromGitHub {
        owner = "jeffreytse";
        repo = "zsh-vi-mode";
        rev = "287efa19ec492b2f24bb93d1f4eaac3049743a63";
        sha256 = "HMfC4s7KW4bO7H6RYzLnSARoFr1Ez89Z2VGONKMpGbw=";
      };
    }
    {
      name = "powerlevel10k";
      file = "powerlevel10k.zsh-theme";
      src = pkgs.fetchFromGitHub {
        owner = "romkatv";
        repo = "powerlevel10k";
        rev = "bde5ca4c2aa6e0c52dd7f15cf216dffdb1ec788c";
        sha256 = "IA2pPW8WT/9/jz/+5zDwedkYz+rzyCy0DRnIvDh9zac=";
      };
    }
    {
      name = "catppuccin-zsh-syntax-highlighting";
      file = "themes/catppuccin_mocha-zsh-syntax-highlighting.zsh";
      src = pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "zsh-syntax-highlighting";
        rev = "06d519c20798f0ebe275fc3a8101841faaeee8ea";
        sha256 = "Q7KmwUd9fblprL55W0Sf4g7lRcemnhjh4/v+TacJSfo=";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "e0165eaa730dd0fa321a6a6de74f092fe87630b0";
        sha256 = "4rW2N+ankAH4sA6Sa5mr9IKsdAg7WTgrmyqJ2V1vygQ=";
      };
    }
    {
      name = "zsh-history-substring-search";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-history-substring-search";
        rev = "87ce96b1862928d84b1afe7c173316614b30e301";
        sha256 = "1+w0AeVJtu1EK5iNVwk3loenFuIyVlQmlw8TWliHZGI=";
      };
    }
  ];

  programs.zsh.shellAliases = {
    e = "exit";
    ls = "ls --color=auto";
    ll = "ls -la";
    ref = "exec zsh";

    ga = "git add";
    gaa = "git add *";
    gd = "git diff";
    gs = "git status";
    gc = "git commit -m";
    gps = "git push";
    gpl = "git pull";
    gr = "git reset";
    grm = "git rm";
    grmt = "git remote";
    grs = "git restore";
    gch = "git checkout";
    gb = "git branch";
    gl = "git log";
    gf = "git fetch";
    gcl = "git clone";

    cr = "cargo run";
    ct = "cargo test";
    ca = "cargo add";

    srn = "sudo reboot now";
    srun = "fullupdate";
    yay = "fullupdate";
    ssn = "sudo shutdown now";

    nrs = "sudo nixos-rebuild switch";
    nrsd = "sudo nixos-rebuild switch --dry-run";
    nrb = "sudo nixos-rebuild boot";

    man = "batman";
    rg = "batgrep";

    # code = "codefunc";
    c = "codefunc";
    "c." = "codefunc .";
    cn = "codefunc /etc/nixos";

    # nvim = "nvimfunc";
    n = "nvimfunc";
    "n." = "nvimfunc";
    nn = "nvimfunc /etc/nixos";
  };

  programs.zoxide.enable = true;
  programs.zoxide.enableZshIntegration = true;

  programs.zsh.initExtra = ''
    [[ ! -f /home/dylan/.p10k.zsh ]] || source /home/dylan/.p10k.zsh

    bindkey 'key[Up]' history-substring-search-up

  '';

  programs.zsh.initExtraBeforeCompInit = ''
    function zvm_after_init() {
      bindkey '^I' menu-complete
      bindkey '^F' vi-forward-char
      bindkey '^H' backward-kill-word
      bindkey '^K' kill-line

      bindkey '^[[A' history-substring-search-up
      bindkey '^[[B' history-substring-search-down
      bindkey '^[OA' history-substring-search-up
      bindkey '^[OB' history-substring-search-down
      bindkey -M menuselect '^[' undo
      bindkey '^[[Z' reverse-menu-complete

      bindkey '^[[1;5D' vi-backward-word
      bindkey '^[[1;5C' vi-forward-word
      bindkey -M vicmd '^[[1;5D' vi-backward-word
      bindkey -M vicmd '^[[1;5C' vi-forward-word

      auto-ls-cond () {
        if $enable_autols; then
          auto-ls-ls
          auto-ls-git-status
        fi
      }
      
      enable_autols=true

      AUTO_LS_COMMANDS=(cond) 

      codefunc () {
        enable_autols=false
        local prev_dir=$PWD
        if cd $1 ; then
          command code .
        else
          command code
        fi
        cd $prev_dir
        enable_autols=true
      }

      nvimfunc () {
        enable_autols=false
        local prev_dir=$PWD
        if [ "$#" -eq "1" ]; then
          cd $1
        fi
        command nvim
        cd $prev_dir
        enable_autols=true
      }

      fullupdate () {
        enable_autols=false
        local prev_dir=$PWD
        cd /etc/nixos
        nix flake update
        sudo nixos-rebuild switch
        cd $prev_dir
        enable_autols=true
      }
    }
  '';

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };
}
