# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, vimUtils, ... }:

# check this  https://github.com/notusknot

{
imports = [
  <home-manager/nixos>
  ./hardware-configuration.nix
  /home/wsz/.config/musnix
];

#---BOOTLOADER
boot.loader.systemd-boot.enable      = true;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.efi.efiSysMountPoint     = "/boot/efi";
systemd.extraConfig                  = ''DefaulTimeOutStopSec=10s'';
#boot.loader.systemd-boot.enable      = true;       # VM
#boot.loader.grub.enable              = true;       # VM
#boot.loader.grub.version             = 2;          # VM
#boot.loader.grub.device              = "/dev/sda"; # VM
#---ENV
#environment.variables = { EDITOR = "vim"; };
environment.systemPackages   = with pkgs; [
  vim
  wget
  zip
  unzip
  git
  fzf
  ack
  fasd fd
  tldr
  tmux
];
environment.sessionVariables = rec {
    DOT              = "~/.dot";
    FZF_DEFAULT_OPTS = "--height 50%";
    PATH             = [];
    #ZDOTDIR          = "$DOT/config/zsh/";
};
#---NIX
system.stateVersion        = "22.05";
time.timeZone              = "Europe/Paris";
i18n.defaultLocale         = "en_US.utf8";
nixpkgs.config.allowUnfree = true;
nix.autoOptimiseStore      = true;
nix.gc.automatic = true;
nix.gc.dates     = "daily";
nix.extraOptions = "experimental-features = nix-command flakes";
#system.autoUpgrade.enable = true;
#system.autoUpdate.enable = true;
#---USERS
users.users.wsz = {
  shell        = pkgs.zsh;
  isNormalUser = true;
  description  = "wsz";
  extraGroups  = [ "networkmanager" "wheel" "video" "audio" ];
  packages     = with pkgs; [
    libclang
    neovim
    cava
    xdotool
    xorg.xgamma
    barrier
    xdotool
    bat
    xclip
    unclutter
    redshift
    bitwarden
    acpilight
    nodejs
    librewolf
    trash-cli
    kitty
    mpv
    youtube-dl
    nmap
    supercollider-with-plugins haskell-language-server
    ghc cabal-install pulseaudio pavucontrol
  ];
};
users.users.tidal  = {
  shell        = pkgs.zsh;
  isNormalUser = true;
  description  = "tidal";
  extraGroups  = [ "networkmanager" "wheel" "video" "audio" ];
  packages     = with pkgs; [
    supercollider-with-plugins haskell-language-server
    ghc cabal-install pulseaudio pavucontrol
    librewolf
  ];
};
#---AUDIO
sound.enable             = false; # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
musnix.enable            = true;
security.rtkit.enable    = true;  # (pipewire) rtkit is optional but recommended
services.pipewire.enable = true;
services.pipewire = {
  alsa.enable         = true;
  alsa.support32Bit   = true;
  pulse.enable        = true;
  jack.enable         = true;
  config.pipewire = {
    "context.properties" = {
               "link.max-buffers"          = 16; # default 16 version < 3 clients can't handle more than this
               "log.level"                 = 2; # https://docs.pipewire.org/page_daemon.html
               "default.clock.rate"        = 48000;
               "default.clock.quantum"     = 2048;
               "default.clock.min-quantum" = 64;
               "default.clock.max-quantum" = 8192;
                           };
                     };
};
#---TLP
# https://discourse.nixos.org/t/thinkpad-t470s-power-management/8141/3
#boot.kernelParams                 = ["intel_pstate=disable"];
services.tlp.enable              = false; # Power management
services.upower.enable           = true; # Power management
boot.initrd.availableKernelModules = [ "thinkpad_acpi" ];
services.tlp.settings = {
  CPU_BOOST_ON_BAT                = 0;
  CPU_SCALING_GOVERNOR_ON_AC      = "performance";
  CPU_SCALING_GOVERNOR_ON_BATTERY = "powersave";
  CPU_MAX_PERF_ON_AC              = 100;
  CPU_MAX_PERF_ON_BAT             = 100;
  START_CHARGE_THRESH_BAT0        = 50;
  STOP_CHARGE_THRESH_BAT0         = 90;
  RUNTIME_PM_ON_BAT               = "auto";
  RUNTIME_PM_ON_AC                = "on";
  SOUND_POWER_SAVE_ON_AC          = 0;
  SOUND_POWER_SAVE_ON_BAT         = 1;
  NATACPI_ENABLE                  = 1;
  TPACPI_ENABLE                   = 1;
  TPSMAPI_ENABLE                  = 1;
};
#--XORG X11
programs.light.enable             = true;  # Backlight control
services.physlock.enable          = true;
services.physlock.allowAnyUser    = true;
services.xserver.virtualScreen    = {x = 1920; y = 1080;};
services.xserver.xautolock.enable = true;
services.xserver.xautolock.locker = "/run/wrappers/bin/physlock";
services.redshift.enable          = false;
services.redshift.temperature     = {day = 3750; night = 3750;};
location.latitude                 = 0.0;
location.longitude                = 0.0;
services.autorandr.enable         = true;
services.xserver = {
  enable                        = true;
  autoRepeatDelay               = 250;
  autoRepeatInterval            = 25;
  layout                        = "us";
  xkbVariant                    = "";
  desktopManager.xterm.enable   = false;
  displayManager.startx.enable  = true;
  #displayManager.defaultSession = "none+i3";
  windowManager.i3              = {
    package = pkgs.i3-gaps;
    enable = true;
    extraPackages = with pkgs; [
      rofi  i3status  i3blocks arandr
      conky unclutter feh
    ];
  };
};
#---NETWORK
networking.firewall.enable       = true;
networking.networkmanager.enable = true;
networking.wireless.enable       = false;  # Enables wireless support via wpa_supplicant.
networking.firewall.allowedTCPPorts      = [ 80 443 ];
networking.firewall.allowedUDPPortRanges = [ { from = 0; to = 0; } ];
networking.hostName                      = "t460"; # Define your hostname.
#---TOUCHPAD
services.xserver.libinput.enable                    = true;
services.xserver.libinput.touchpad.middleEmulation  = true;
services.xserver.libinput.touchpad.naturalScrolling = true;
services.xserver.libinput.touchpad.tapping          = true;
#---FONTS
fonts.fonts = with pkgs; [
  noto-fonts
  liberation_ttf
  fira-code-symbols
  material-icons
  font-awesome
  nixos-icons
  proggyfonts
  scientifica
  roboto
  nerdfonts
];

########################################################################################

#---HOME MANAGER
home-manager.useGlobalPkgs = true;
home-manager.users.wsz = { pkgs, ... }: {
  #home.packages = with pkgs; [zsh];
  #--- GIT
  programs.git = {
    enable = true;
    userName = "wsz";
    userEmail = "wsz@nix.os";
  };
  #---ZSH
  programs.zsh = {
    enable                   = true;
    enableAutosuggestions    = true;
    enableCompletion         = true;
    enableSyntaxHighlighting = true;
    autocd                   = true;
    envExtra = ''
    '';
    initExtra = ''
      eval "$(fasd --init auto)"
      #---FZF
      source "$(fzf-share)/key-bindings.zsh"
      source "$(fzf-share)/completion.zsh"
      #---PROMPT
      MNML_PROMPT=(mnml_status mnml_cwd)
      MNML_RPROMPT=(mnml_ssh mnml_jobs mnml_git mnml_err)
      MNML_INFOLN=()
      MNML_MAGICENTER=()
      MNML_OK_COLOR=5
      MNML_ERR_COLOR=3
      #---ZSH COLORS
      ZSH_HIGHLIGHT_STYLES[path]='fg=gray, italic'
      ZSH_HIGHLIGHT_STYLES[builtin]='fg=yellow, bold'
      ZSH_HIGHLIGHT_STYLES[alias]='fg=yellow, bold'
      ZSH_HIGHLIGHT_STYLES[command]='fg=yellow, bold'
      ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=yellow, bold'
      ZSH_HIGHLIGHT_STYLES[global-alias]='fg=cyan'
      ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=magenta'
      ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta'
      ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta'
      ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty)
      #---ZSH HISTORY
      HISTSIZE=10000
      SAVEHIST=10000
      setopt HIST_IGNORE_ALL_DUPS
      setopt HIST_FIND_NO_DUPS
      setopt HIST_REDUCE_BLANKS
      setopt INC_APPEND_HISTORY_TIME
      setopt EXTENDED_HISTORY
    '';
    zplug = {
      enable = true;
      plugins = [
        { name = "aloxaf/fzf-tab";}
        { name = "supercrabtree/k";}
        { name = "subnixr/minimal";}
      ];
    };
    shellAliases = {
      vrc = "vim ~/.nix/extraConfig.vim";
      search = "nix search nixpkgs";
      ns = "nix-shell -p";
      tdv = "~/.nix/bin/tidal/bin/tidalvim";
      tdvk="tmux kill-session -t tidal";
      j         = "fasd_cd -d";
      v         = "xdotool key v i m space asterisk asterisk Tab";
      c         = "xdotool key c d space asterisk asterisk Tab";
      l         = "k";
      ls        = "k";
      sl        = "k";
      lsa       = "k -ah";
      del       = "trash-put";
      ll        = "ls -l";
      nrc       = "vim ~/.nix/configuration.nix";
      vim       = "nvim";
      rebuild   = "sudo cp ~/.nix/configuration.nix /etc/nixos/ && sudo nixos-rebuild switch";
      gitap     = "git add . && git status && git commit -m . && git push";
      nixsearch = "librewolf https://search.nixos.org/packages";
    };
  };
  #---VIM (home manager component)
  programs.neovim = {
    enable      = true;
    vimAlias    = true;
    viAlias     = true;
    withPython3 = true;
    extraConfig = "source ~/.nix/extraConfig.vim";
    #withNodeJs = true; # seems broken
    plugins     = with pkgs.vimPlugins; [
      #---COC
      coc-nvim
      coc-cmake
      coc-clangd
      coc-fzf
      coc-ultisnips
      coc-yank
      coc-snippets
      coc-diagnostic
      coc-explorer
      #---WEB
      coc-html
      coc-css
      coc-emmet
      coc-json
      coc-eslint
      coc-tsserver
      coc-tslint-plugin
      coc-tailwindcss
      #---MISC
      #vim-nix
      #nvim-fzf
      #vim-sayonara
      #colorizer
      #toggleterm-nvim
      #nerdcommenter
      #vim-gitgutter
      #lessspace-vim
      #undotree
      #neoformat
      #vim-textobj-entire
      #nvim-scrollview
      #vim-smoothie
      #wilder-nvim
      #nvim-web-devicons
      #i3config-vim
      #{
        #plugin = undotree;
        #config = ''
          #let g:undotree_WindowLayout         = 2
          #let g:undotree_ShortIndicators      = 1
          #let g:undotree_SetFocusWhenToggle   = 1
          #let g:undotree_HighlightChangedText = 1
          #let g:undotree_HelpLine             = 1
        #'';
      #}
      #{
        #plugin = vim-easy-align;
        #config = ''
          #xmap ga <Plug>(EasyAlign)
          #nmap ga <Plug>(EasyAlign)
        #'';
      #}
      #{
        #plugin = vim-visual-multi;
        #config = ''
          #let g:VM_maps = {}
          #let g:VM_maps["Select All"]                  = '\\a'
          #let g:VM_maps["Add Cursor Down"]             = '<S-Down>'
          #let g:VM_maps["Add Cursor Up"]               = '<S-Up>'
          #let g:VM_maps["Add Cursor At Pos"]           = '\\\'
          #let g:VM_maps['Find Under']                  = '<C-n>'
        #'';
      #}
    ];
  };

};

########################################################################################

###########
# ARCHIVE #
###########

  #---FISH
  #programs.fish.enable               = true; # check home manager fish page
  #programs.fish.shellAbbrs           = {};
  #programs.fish.functions            = {};
  #programs.fish.shellInit            = "";
  #programs.fish.loginShellInit       = "";
  #programs.fish.interactiveShellInit = "";
  #programs.fish.plugins              = [
    #{ name = "forgit"; src   = pkgs.fishPlugins.forgit.src; }
    #{ name = "done"; src     = pkgs.fishPlugins.done.src; }
    #{ name = "hydro"; src    = pkgs.fishPlugins.hydro.src; }
    #{ name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
    ##{ name = "pure"; src     = pkgs.fishPlugins.pure.src; }
  #];
  #programs.fish.shellAliases = {
    #v         = "xdotool key v i m KP_Space Control_L+Alt_L+f";
    #del       = "trash-put";
    #ll        = "ls -l";
    #nrc       = "vim ~/.nix/configuration.nix";
    #vim       = "nvim";
    #rebuild   = "sudo cp ~/.nix/configuration.nix /etc/nixos/ && sudo nixos-rebuild switch";
    #gitap     = "git add . && git status && git commit -m . && git push";
    #nixsearch = "librewolf https://search.nixos.org/packages";
  #};

  #---VIM (home manager component)
  #programs.neovim = {
    #enable = true;
    #vimAlias = true;
    #viAlias = true;
    ##withNodeJs = true; # seems broken
    #withPython3 = true;
    #plugins = with pkgs.vimPlugins; [
      #vim-nix
      #nvim-fzf
      #coc-nvim
      #coc-clangd
      #coc-fzf
      #coc-ultisnips
      #coc-yank
      #coc-snippets
      #coc-html
      #coc-emmet
      #coc-json
      #{
        #plugin = undotree;
        #config = ''
          #let g:undotree_WindowLayout         = 2
          #let g:undotree_ShortIndicators      = 1
          #let g:undotree_SetFocusWhenToggle   = 1
          #let g:undotree_HighlightChangedText = 1
          #let g:undotree_HelpLine             = 1
        #'';
      #}
      #vim-sayonara
      #colorizer
      #toggleterm-nvim
      #gruvbox
      #nerdcommenter
      #papercolor-theme
      #vim-gitgutter
      #lessspace-vim
      #undotree
      #neoformat
      #vim-textobj-entire
      #{
        #plugin = vim-easy-align;
        #config = ''
          #xmap ga <Plug>(EasyAlign)
          #nmap ga <Plug>(EasyAlign)
        #'';
      #}
      #{
        #plugin = vim-visual-multi;
        #config = ''
          #let g:VM_maps = {}
          #let g:VM_maps["Select All"]                  = '\\a'
          #let g:VM_maps["Add Cursor Down"]             = '<S-Down>'
          #let g:VM_maps["Add Cursor Up"]               = '<S-Up>'
          #let g:VM_maps["Add Cursor At Pos"]           = '\\\'
          #let g:VM_maps['Find Under']                  = '<C-n>'
        #'';
      #}
      #nvim-scrollview
      #vim-smoothie
      #wilder-nvim
      #nvim-web-devicons
      #i3config-vim
      ##indentLine

      ##nvim-lspconfig # read about lsp
      ##nvim-cmp # auto completion
      ##nvim-tree-lua # ?
      ##nvim-treesitter # ?
      ##bufferline-nvim # ?
      ##galaxyline-nvim # ?
      ##{
        ##plugin = gruvbox-material;
        ##config = ''
         ##let g:gruvbox_material_background = 'hard'
         ##colorscheme gruvbox-material
        ##'';
      ##}
    #];

    ##extraPackages = with pkgs.nodePackages; [
      ##coc-clangd
    ##];

    #extraConfig = ''

      #if has('persistent_undo')         "check if your vim version supports
      #set undodir=$HOME/.undo     "directory where the undo files will be stored
      #set undofile                    "turn on the feature
      #endif

      #autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()

      #set encoding=utf-8
      #set complete-=5
      #set lazyredraw
      #set re=1
      #set timeoutlen=1000
      #set ttimeoutlen=0
      #set synmaxcol=400
      #syntax sync minlines=256
      #set linebreak
      #set nowrap

      #set list
      #set listchars=space:.,tab:•-,trail:~,extends:>,precedes:<

      #filetype indent on
      #filetype plugin on
      #set autoindent
      #set cindent
      #set smartindent

      #source ~/.nix/color.vim
      #set clipboard=unnamed,unnamedplus
      #set scrolloff=1000
      #set noswapfile
      #set nu
      #set mouse=a
      #set relativenumber
      #set nocursorline
      #set background=dark
      #if has ('termguicolors')
        #set termguicolors
      #endif
      #let &t_SI .= "\<Esc>[?2004h"
      #let &t_EI .= "\<Esc>[?2004l"
      #inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
      #function! XTermPasteBegin()
        #set pastetoggle=<Esc>[201~
        #set paste
        #return ""
      #endfunction

    #'';
  #};

# Select internationalisation properties.
#time.timeZone            = "Europe/Paris";
#i18n.defaultLocale       = "en_US.utf8";
  #i18n.extraLocaleSettings = {
  #LC_ADDRESS           = "fr_FR.utf8";
  #LC_IDENTIFICATION    = "fr_FR.utf8";
  #LC_MEASUREMENT       = "fr_FR.utf8";
  #LC_MONETARY          = "fr_FR.utf8";
  #LC_NAME              = "fr_FR.utf8";
  #LC_NUMERIC           = "fr_FR.utf8";
  #LC_PAPER             = "fr_FR.utf8";
  #LC_TELEPHONE         = "fr_FR.utf8";
  #LC_TIME              = "fr_FR.utf8";
  #};

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
#system.stateVersion = "22.05"; # Did you read the comment?


# ---
# Tlp extra settings # https://discourse.nixos.org/t/thinkpad-t470s-power-management/8141/3

#boot.extraModprobeConfig = lib.mkMerge [
## idle audio card after one second
#"options snd_hda_intel power_save=1"
## enable wifi power saving (keep uapsd off to maintain low latencies)
#"options iwlwifi power_save=1 uapsd_disable=1"
#];

#services.udev.extraRules = lib.mkMerge [
## autosuspend USB devices
#''ACTION=="add", SUBSYSTEM=="usb", TEST=="power/control", ATTR{power/control}="auto"''
## autosuspend PCI devices
#''ACTION=="add", SUBSYSTEM=="pci", TEST=="power/control", ATTR{power/control}="auto"''
## disable Ethernet Wake-on-LAN
#''ACTION=="add", SUBSYSTEM=="net", NAME=="enp*", RUN+="${pkgs.ethtool}/sbin/ethtool -s $name wol d"''
#];
# ---
# Neovim
#environment.variables.EDITOR = "nvim";
#programs.neovim.viAlias      = true;systemctl status "home-manager-$USER.service"
#programs.neovim.vimAlias     = true;

#services.greetd = {
#enable = true;
#settings = {
#default_session = {
#command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd startx";
#user = "wsz";
#};
#};
#};


}



####################################################################################################################
####################################################################################################################






