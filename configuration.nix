# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, vimUtils, ... }:

# check this  https://github.com/notusknot

{
  imports =
    [ # Include the results of the hardware scan.
    <home-manager/nixos>
    ./hardware-configuration.nix
    /home/wsz/.config/musnix
  ];


  environment.systemPackages = with pkgs; [
    fzf
  ];

  #system.autoUpgrade.enable = true;
  #system.autoUpdate.enable = true;
  nix.autoOptimiseStore = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
  };


  services.xserver.virtualScreen = {x = 1920; y = 1080;};

##############.
# System     #
##############.
users.users.wsz  = {
  shell        = pkgs.fish;
  isNormalUser = true;
  description  = "wsz";
  extraGroups  = [ "networkmanager" "wheel" "video" "audio" ];
  packages     = with pkgs; [
    nodejs
    librewolf
    trash-cli
    fzf
    ack
    kitty
  ];
};


home-manager.useGlobalPkgs = true;
#home-manager.users.wsz = { pkgs, ... }: {
home-manager.users.wsz = {
  xdg.userDirs = {
    enable = true;
    documents = "$HOME/box";
    download = "$HOME/box";
    desktop = "$HOME/box";
    publicShare = "$HOME/box";
    templates = "$HOME/box";
  };


  programs.git = {
    enable = true;
    userName = "wsz";
    userEmail = "wsz@nix.os";
  };
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    #withNodeJs = true; # seems broken
    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nvim-fzf
      coc-nvim
      coc-clangd
      coc-fzf
      coc-ultisnips
      coc-yank
      coc-snippets
      coc-html
      coc-emmet
      coc-json
      vim-sayonara
      colorizer
      toggleterm-nvim
      gruvbox
      nerdcommenter
      papercolor-theme
      vim-visual-multi
      vim-gitgutter
      lessspace-vim
      undotree
      vim-easy-align
      nvim-scrollview
      vim-smoothie
      wilder-nvim
      nvim-web-devicons
      i3config-vim
      indentLine # ?

      #nvim-lspconfig # read about lsp
      #nvim-cmp # auto completion
      #nvim-tree-lua # ?
      #nvim-treesitter # ?
      #bufferline-nvim # ?
      #galaxyline-nvim # ?
      #{
        #plugin = gruvbox-material;
        #config = ''
         #let g:gruvbox_material_background = 'hard'
         #colorscheme gruvbox-material
        #'';
      #}
    ];

    #extraPackages = with pkgs.nodePackages; [
      #coc-clangd
    #];

    extraConfig = ''
         set nu
         set mouse=a
         set relativenumber
         set cursorline
         set background=dark
         if has ('termguicolors')
         source ~/ok.vim
          set termguicolors
        endif
    '';
  };
  programs.fish.enable = true;
  programs.fish.plugins = [
    { name = "forgit"; src = pkgs.fishPlugins.forgit.src; }
    { name = "done"; src = pkgs.fishPlugins.done.src; }
    { name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
    { name = "fzf-fish"; src = pkgs.fishPlugins.fzf-fish.src; }
  ];
  programs.fish.shellAliases = {
    del = "trash-put";
    ll     = "ls -l";
    nrc = "vim ~/nix/configuration.nix";
    vim    = "nvim";
    rebuild = "sudo cp ~/nix/configuration.nix /etc/nixos/ && sudo nixos-rebuild switch";
    gitap = "git add . && git status && git commit -m . && git push";
  };
};



# Xautolock ?
services.physlock.enable          = true;
services.physlock.allowAnyUser    = true;
services.xserver.xautolock.enable = true;
services.xserver.xautolock.locker = "/run/wrappers/bin/physlock";


services.tlp.enable              = false; # Power management
services.upower.enable           = false; # Power management
musnix.enable                    = true;

nixpkgs.config.allowUnfree       = true;
#programs.zsh.enable              = true;
programs.light.enable            = true;  # Backlight control
#programs.neovim.enable           = false;
networking.firewall.enable       = true;
networking.networkmanager.enable = true;
networking.wireless.enable       = false;  # Enables wireless support via wpa_supplicant.
sound.enable                     = false; # Remove sound.enable or turn it off if you had it set previously, it seems to cause conflicts with pipewire
security.rtkit.enable            = true;  # (pipewire) rtkit is optional but recommended
services.pipewire.enable         = true;
services.redshift.enable         = true;
services.autorandr.enable        = true;



#########
# AUDIO #
#########

services.pipewire = {

  alsa.enable         = true;
  alsa.support32Bit   = true;
  pulse.enable        = true;
  jack.enable         = true;
  config.pipewire = {
    "context.properties" = {
      "link.max-buffers"          = 32;
#"link.max-buffers"         = 16; # version < 3 clients can't handle more than this
"log.level"                 = 2; # https://docs.pipewire.org/page_daemon.html
"default.clock.rate"        = 48000;
"default.clock.quantum"     = 4096;
"default.clock.min-quantum" = 64;
"default.clock.max-quantum" = 8192;
};
};
};


##############
#    ENV     #
##############

environment.sessionVariables = rec {
DOT              = "\${HOME}/.nix";
FZF_DEFAULT_OPTS = "--height 50%";
ZDOTDIR          = "\${HOME}/.nix/config/zsh/";
PATH             = [
"\$DOT/bin/scripts"
"\$DOT/bin/bookmarks"
"\${HOME}/.local/bin"
];
};



#######################################
#                 TLP                 #
#######################################

# https://discourse.nixos.org/t/thinkpad-t470s-power-management/8141/3
#boot.kernelParams                 = ["intel_pstate=disable"];
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



#################
# Configure X11 #
#################

services.xserver = {
enable                        = true;
autoRepeatDelay               = 250;
autoRepeatInterval            = 25;
layout                        = "us";
xkbVariant                    = "";
desktopManager.xterm.enable   = false;
displayManager.startx.enable  = false;
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

###################
# SYSTEM PACKAGES #
###################

# List packages installed in system profile. To search, run:
# $ nix search wget
#environment.systemPackages = with pkgs; [
#  vim     neovim      tmux      wget
#  gnumake xorg.xgamma xorg.xset xorg.xev
#  git     xclip       fzf       ack
#  tldr    fasd        nodejs    trash-cli
#  killall home-manager
#  readline
#];

#########
# USERS #
#########

# Define a user account. Don't forget to set a password with ‘passwd’.
#users.users.wsz  = {
#  shell        = pkgs.fish;
#  isNormalUser = true;
#  description  = "wsz";
#  extraGroups  = [ "networkmanager" "wheel" "video" "audio" ];
#  packages     = with pkgs; [
#    mpv pulseaudio pavucontrol youtube-dl
#    croc librewolf  htop
#    nmap rsstail bitwarden
#    element-desktop tdesktop signal-desktop
# TEMP
#supercollider-with-plugins
#ghc
#haskell-language-server
#cabal-install
#cava
#                   ];
#  };

users.users.sc  = {
  shell        = pkgs.zsh;
  isNormalUser = true;
  description  = "wsz";
  extraGroups  = [ "networkmanager" "wheel" "video" "audio" ];
  packages     = with pkgs; [
    supercollider-with-plugins haskell-language-server
    ghc cabal-install pulseaudio pavucontrol
    librewolf
  ];
};

users.users.test  = {
  shell        = pkgs.zsh;
  isNormalUser = true;
  description  = "wsz";
  extraGroups  = [ "networkmanager" "wheel" "video" ];
  packages     = with pkgs; [
    librewolf
  ];
};

users.users.none  = {
  shell        = pkgs.zsh;
  isNormalUser = true;
  description  = "wsz";
  extraGroups  = [ "networkmanager" ];
  packages     = with pkgs; [
    gnome.gnome-boxes
  ];
};



# Firewall
networking.firewall.allowedTCPPorts                 = [ 80 443 ];
networking.firewall.allowedUDPPortRanges            = [ { from = 0; to = 0; } ];

# Networking
networking.hostName                                 = "t460"; # Define your hostname.
# Configure network proxy if necessary
#networking.proxy.default        = "http://user:password@proxy:port/";
#networking.proxy.noProxy        = "127.0.0.1,localhost,internal.domain";

# Redshift
services.redshift.temperature                       = {day = 3750; night = 3750;};
location.latitude                                   = 0.0;
location.longitude                                  = 0.0;

# Bootloader
#boot.loader.systemd-boot.enable                     = true;
boot.loader.grub.enable=true;
boot.loader.grub.version=2;
boot.loader.grub.device="/dev/sda";
#boot.loader.efi.canTouchEfiVariables                = true;
#boot.loader.efi.efiSysMountPoint                    = "/boot/efi";
#systemd.extraConfig                                 = ''DefaulTimeOutStopSec=10s'';

# Touchpad
services.xserver.libinput.enable                    = true;
services.xserver.libinput.touchpad.middleEmulation  = true;
services.xserver.libinput.touchpad.naturalScrolling = true;
services.xserver.libinput.touchpad.tapping          = true;

# Fonts
fonts.fonts = with pkgs; [
  noto-fonts
  liberation_ttf
  fira-code-symbols
  proggyfonts
  scientifica
  roboto
  nerdfonts
];

# Select internationalisation properties.
time.timeZone            = "Europe/Paris";
i18n.defaultLocale       = "en_US.utf8";
i18n.extraLocaleSettings = {
  LC_ADDRESS           = "fr_FR.utf8";
  LC_IDENTIFICATION    = "fr_FR.utf8";
  LC_MEASUREMENT       = "fr_FR.utf8";
  LC_MONETARY          = "fr_FR.utf8";
  LC_NAME              = "fr_FR.utf8";
  LC_NUMERIC           = "fr_FR.utf8";
  LC_PAPER             = "fr_FR.utf8";
  LC_TELEPHONE         = "fr_FR.utf8";
  LC_TIME              = "fr_FR.utf8";
};


############
# DEFAULTS #
############

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
system.stateVersion = "22.05"; # Did you read the comment?

###########
# ARCHIVE #
###########

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



}



####################################################################################################################
####################################################################################################################






