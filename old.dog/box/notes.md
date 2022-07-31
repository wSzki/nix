-----------------------------------------------------------
# NOTES

gcc -O1 -O2 -O3 for optimization
compile with gcc -ggdb3  for valgrind
-fsanitize=thread
> Auchan : auchan@yoggm.com
> MICROKORG: Center neg 5.5x2.1






-----------------------------------------------------------

# SYSTEM
### ADBLOCKER
	git  clone git://r-36.net/hosts-gen
	cd   hosts-gen
	sudo make install
	sudo cp examples/gethostszero /bin
	sudo chmod 775 /bin/gethostszero
	sudo /bin/gethostszero
	sudo hosts-gen

### FIX DPI
	xlayoutdisplay[AUR]
	.Xressources > Xft.dpi: 96

### DOWNGRADE
	pacman -U LINK_FROM_ARHIVE_ARCH_COM

### VNC
	fix libcrypt.so.1
	sudo ln -s /usr/lib/libcrypt.so.2.0.0 /usr/lib/libcrypt.so.1

### AUDIO
	> install alsamixer pactl utils for audio
	> pavucontrol pulseaudio control GUI
	pulseaudio
	alsa-tools
	alsa-utils
	pavucontrol
	λ ~ git clone https://github.com/hoyon/mpv-mpris //for  playerctl with mpv

### WIFI
	- | NETWORKMANAGER |
	- dhcpd is for ethernet
	- sudo systemctl enable dhcpcd.service
	- wifi-menu
	- dialog
	- netctl
	- openresolv
	- nmtui
	- nmcli radio wifi on off
	- nm-connection-editor > GUI

```
[connection]
id=uwosecure-v2
uuid= "UUID" (Don't know if needed)
type=802-11-wireless

[802-11-wireless]
ssid=uwosecure-v2
mode=infrastructure
security=802-11-wireless-security

[802-1x]
eap=peap;
identity=username
ca-cert="path to Thawte_Premium_Server_C... without quotes"
phase2-auth=mschapv2
password=********

[ipv4]
method=auto

[802-11-wireless-security]
key-mgmt=wpa-eap
```

	- | NETCTL |
	sudo ip link set wlan0 down
	sudo systemctl stop NetworkManager.service
	sudo systemctl disable NetworkManager.service
	sudo systemctl enable netctl-auto@wlan0.service
	sudo systemctl start netctl-auto@wlan0.service
	Set priority in config file /etc/netctl/wlan0-...

### NVIM
	> Python install
	python3 -m pip install --user --upgrade pynvim
	> Fix highlighting
	.config/nvim/coc-settings.json
	```sh
		{
			"coc.preferences.semanticTokensHighlights": false
		}
	```

### MOUSE FLICKER
	xrandr --output eDP-1 --auto --output HDMI-2 --auto --scale 2x2 --right-of eDP-1  # Simpler oneliner scaling
	xrandr --output eDP-1 --scale 0.9999x0.9999  # Stop flicker
	xf86-video-nouveau ?

### MOUSE SIZE
	> .Xresources
		Xcursor.size: 12

### VSCODE THEME LOCATION
/home/wsz/.vscode-oss/extensions/sainnhe.gruvbox-material-6.3.4/themes

### HUB
	Generate token in github > dev.settings
	Use instead password, username = wszki

### SECURITY, SUDO
	> visudo > Defaults logfile=/var/log/sudo
		sudo passwd -l root
		sudo passwd -u root - unlock

### BACKLIGHT
	> add user to video group for backlight control
	> acpi backlight

### SYSTEM
	tp_smapi

### TLP
	> openresolv
	sudo tlp start
	sudo tlp true
	sudo tlp stat -s
	sudo systemctl start tlp.service
	sudo systemctl start tlp.service
	sudo systemctl enable tlp-sleep.service
	sudo systemctl enable tlp-sleep.service
	sudo systemctl mask systemd-rfkill.service
	sudo systemctl mask systemd-rfkill.socket
	sudo systemctl restart nscd.service
	sudo systemctl restart named
	sudo systemctl restart dnsmasq

### I3
	> sudo vim /lib/python3.9/site-packages/autotiling/main.py
	> l.50 -  get_tree().find_focused().workspace().descendents()
	> 			and number > 2
	```python
	def switch_splitting(i3, e, debug, workspaces):
    try:
        number = len(i3.get_tree().find_focused().workspace().descendants())
        con = i3.get_tree().find_focused()
        if con and not workspaces or (str(con.workspace().num) in workspaces):
            if con.floating:
                # We're on i3: on sway it would be None
                # May be 'auto_on' or 'user_on'
                is_floating = "_on" in con.floating
                is_full_screen = con.fullscreen_mode == 1
            else:
                # We are on sway
                is_floating = con.type == "floating_con"
                is_full_screen = con.fullscreen_mode == 1

            is_stacked = con.parent.layout == "stacked"
            is_tabbed = con.parent.layout == "tabbed"

            # Let's exclude floating containers, stacked layouts, tabbed layouts and
            # full screen mode
            if (not is_floating
                    and not is_stacked
                    and not is_tabbed
                    and not is_full_screen
                    and number > 2):
                new_layout = "splitv" if con.rect.height > con.rect.width else "splith"

                if new_layout != con.parent.layout:
                    result = i3.command(new_layout)
                    if result[0].success and debug:
                        print("Debug: Switched to {}".format(new_layout), file=sys.stderr)
                    elif debug:
                        print("Error: Switch failed with err {}".format(result[0].error), file=sys.stderr, )

        elif debug:
            print("Debug: No focused container found or autotiling on the workspace turned off", file=sys.stderr)

    except Exception as e:
        print("Error: {}".format(e), file=sys.stderr)
	```

### SKINS
	Nordic-darker
	Roboto mono | Terminus
	Numix icon theme

-----------------------------------------------------------

# 42

# bear -- make
add .h dependencies

# MAKEFILE
#Auto update
#@printf "\033[2K\r$(BLUE)$(NAME)$(RESET)$(BLUE): $(GREEN)Compiled [√]$(RESET)\n"


### WIFI
	> Use nm-connection-editor
	cd /etc/NetworkManager/system-connections
	systemctl enable wpa_supplicant.service
	cp /usr/share/doc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant
	```
      network={
          ssid="42"
              scan_ssid=1
              key_mgmt=WPA-EAP
              auth_alg=OPEN
              eap=PEAP
              identity=""
              password=""
             phase1="peaplabel=0"
             phase2="auth=MSCHAPV2"
     }

	```
	> sudo touch SSID #SSID is the name of the profile, e.g. eduroam
	> sudo nano SSID
	```sh
	[ipv6]
	method=auto

	[connection]
	id=SSID #(e.g.EDUroam)
	uuid=9e123fbc-0123-46e3-97b5-f3214e123456 #unique uuid will be created upon creation of this profile
	type=802-11-wireless

	[802-11-wireless-security]
	key-mgmt=wpa-eap
	auth-alg=open

	[802-11-wireless]
	ssid=SSID
	mode=infrastructure
	mac-address=0A:12:3C:DA:C1:A5
	security=802-11-wireless-security

	[802-1x]
	eap=peap;
	identity=studentid123123
	phase2-auth=mschapv2
	password=mypass123123

	[ipv4]
	method=auto
	```

-----------------------------------------------------------

# MISC
### YOUTUBE-DL
	youtube-dl  -xo '%(title)s.%(ext)s' -f 'bestaudio[ext=wav]/best[ext=wav]/best' https://www.youtube.com/watch\?v\=qi66H_04Ppsls

### POWERTOP
	etc/default/cpupower -> set default governor

### RASPBERRY
	> startx is in /etc/profile
	> In /boot/config.txt
	framebuffer_width=1900
	framebuffer_height=1024
	> -- disable
	> #dtoverlay=vc4-fkms-v3d

### WEBCAM DISABLE
echo "blacklist uvcvideo" > /etc/modprobe.d/disable_webcam.conf

-----------------------------------------------------------

# AUR
### VIRTUALBOX
	- linux-zen-headers
	- dkms
	- virtualbox-host-modules (arch is for og linux only)
	- sudo modprobe vboxdrv
	- yay -S virtualbox-ext-oracle

### BIN

	- duf
	- dust
	- lfs
	- khal
	- autorandr
	- freetube
	- transfer.sh
	- cointop
	- firejail
	- apparmor
	- selinux
	- keepassxc
	- bitwarden
	- authy
	- haxor-news
	- cointop
	- xev // keystroke monitor
	- xprop // window properties
	- curl cheat.sh
	- sysstat -> mpstat
	- picom - compton // opacity, fade
	- compiz // mission control, check SCALE plugin
	- taskwarrior-tui-git
	- xorg-xfd // print charsets
	- ttf-scientifica
	- pkg-utils
	- pkgconfig
	- libx11-dev // Xatom.h for st
	- libxft-dev
	- make
	- gcc
	- colorgcc
	- cpupower
	- valgrind
	- gdb
	- modprobe v4l2loopback // video streaming
	- cronwhip - anacron
	- ddgr // duck research terminal
	- googler // google research terminal
	- info
	- howdoi
	- croc // awesome file sharing
	- cdecl // c explain
	- greenclip - rofi clipboard manager
	- arranger = file organiser
	- remind
	- birthday - reminder
	- rtv - reddit
	- fwupd  -  update firmware
	- ytfzf
	- testdrive
	- photorec // recovery pictures
	- mosh // SSH alternative
	- gping
	- ytmdl // BETTER YTDL
	- acpilight // remove xorg-backlight with acpilight -- sudo usermod -aG video wsz; reboot
	- base-devel // raspi base utils
	- nmap // local ip ifnder
	- fasd
	- fontpreview-ueberzug-git
	- autotiling // [i3] // pip install autotiling
	- peek
	- xcape
	- code-minimap
	- xprop // window prop
	- gvim
	- tlpui
	- conky
	- skroll
	- tmpmail-git
	- gotop
	- rsstail
	- epr-git // epub reader?
	- hascard // notes?
	- howdoi// tldr like
	- lcharmap // ansi chracter viewer
	- micro - vim alternative
	- aerc // mail client
	- powertop
	- kmdr
	- ueberzug
	- ytop
	- gnome-boxes
	- ack
	- poppler > pdftotext
	- code
	- xclip
	- alsa-utils
	- strace
	- fzf
	- ranger
	- cfiles
	- calcurse
	- mps-youtube
	- youtube-dl
	- htop
	- pydf
	- gpick
	- xbindkeys
	- unzip
	- tree
	- nemo
	- nomacs
	- lynx
	- evince //pdf
	- mpv
	- mplayer
	- unclutter
	- feh
	- tlp
	- acpi
	- acpid // monitoring AC battery
	- hub
	- tldr
	- duf
	- onionshare
	- librewolf
	- ncdu
	- thefuck
	- zsh-syntax-highlighting
	- zsh-autocompletion
	- rofi
	- i3-gaps
	- i3-blocks
	- i3-status
	- numix-cirlcle-icon-theme.git
	- scrcpy

-----------------------------------------------------------

# SUPERCOLLIDER

## TIDAL

https://github.com/err0r500/tidal-helpers
ln -s $(pwd)/tidal.snippets ~/.config/nvim/UltiSnips/tidal.snippets

you need 3 things:

    install mi-UGens (it's really simple now, download and extract into the supercollider extensions folder the archive: Release v0.0.1 · v7b1/mi-UGens · GitHub 21)
    configure clouds as global effect:
        synthdef: sc-adente/mutable.scd at master · ndr-brt/sc-adente · GitHub 28
        add to orbits: sc-adente/superdirt_startup.scd at master · ndr-brt/sc-adente · GitHub 19
    then you need the parameters on tidal side: sc-adente/Parameters.hs at master · ndr-brt/sc-adente · GitHub 21

	ln -s $(pwd)/tidal.snippets ~/.config/coc/ultisnips/tidal.snippets

BootTidal.hs === /home/wsz/.vim/plugged/vim-tidal/Tidal.ghci ????

- BootTidal.hs
	/usr/share/haskell-tidal/BootTidal.hs

- Tidal script location
	/usr/local/bin/tidalvim

- Install haskell (do not install with aur):
	curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
	> Check if ghci works

- Install tidal
	cabal install tidal --lib
	> or
	cabal install tidal

- Install SuperDirt quark
	sclang
	Quarks.checkForUpdates(); Quarks.install("SuperDirt", "v1.7.3")
	> or
	Quarks.checkForUpdates({Quarks.install("SuperDirt", "v1.7.2"); thisProcess.recompile()})
	> or
	Quarks.checkForUpdates({Quarks.install("SuperDirt", "v1.7.3"); thisProcess.recompile()})

- Quarks are installed here :
	~/.local/share/SuperCollider/downloaded-quarks

- Launch sclang, then start SuperDirt
	sclang
	SuperDirt.start

## FOXDOT
in scide, FoxDot.start() + ctrl Enter
https://crashserver.fr/how-to-customize-foxdot-with-your-own-synths-effects-functions-and-samples/
https://github.com/v7b1/mi-UGens/releases

plaits = Synthdef("plaits");


### EXTENSION LOCATION
	/home/wsz/.local/share/SuperCollider/Extensions

### REALTIME AUDIO
#### BASE
	sudo pacman -S realtime-privileges
	/etc/security/limits.d/99-realtime-privileges.conf
	> @audio          -       rtprio          99
	sudo usermod -a -G realtime wsz

#### CHECKING MISSING COMPONENTS
	git clone git://github.com/raboof/realtimeconfigquickscan.git
	cd realtimeconfigquickscan
	perl ./realTimeConfigQuickScan.pl

### EXTRACT SC SOURCE
	tar xjvf  SuperCollider-3.11.2-Source.tar.bz2

### SC MI EXTENSION TREE
	▲ share/SuperCollider/Extensions tree
		.
		├── MiBraids.so
		├── MiClouds.so
		├── MiElements.so
		├── MiMu.so
		├── MiOmi.so
		├── MiPlaits.so
		├── MiRings.so
		├── MiRipples.so
		├── MiTides.so
		├── MiVerb.so
		├── MiWarps.so
		├── sc
		│   ├── Classes
		│   │   ├── MiBraids.sc
		│   │   ├── MiClouds.sc
		│   │   ├── MiElements.sc
		│   │   ├── MiMu.sc
		│   │   ├── MiOmi.sc
		│   │   ├── MiPlaits.sc
		│   │   ├── MiRings.sc
		│   │   ├── MiRipples.sc
		│   │   ├── MiTides.sc
		│   │   ├── MiVerb.sc
		│   │   └── MiWarps.sc
		│   └── HelpSource
		│       └── Classes
		│           ├── MiBraids.schelp
		│           ├── MiClouds.schelp
		│           ├── MiElements.schelp
		│           ├── MiMu.schelp
		│           ├── MiOmi.schelp
		│           ├── MiPlaits.schelp
		│           ├── MiRings.schelp
		│           ├── MiRipples.schelp
		│           ├── MiTides.schelp
		│           └── MiVerb.schelp
		└── scide_scnvim -> /home/wsz/.vim/plugged/scnvim/scide_scnvim

-----------------------------------------------------------

# M8
	>-use pavucontrol to set default soundcard
		sudo groupadd dialout
		sudo usermod -aG dialout $USER
		sudo usermod -aG uucp $USER
	> config.ini
	`
	[graphics]
	; set this to true to have m8c start fullscreen
	fullscreen=false

	[keyboard]
	; these need to be the decimal value of the SDL scancodes.
	; a table exists here: https://github.com/libsdl-org/sdlwiki/blob/main/SDLScancodeLookup.mediawiki
	key_up=82
	key_left=80
	key_down=81
	key_right=79
	key_select=225
	key_select_alt=4
	key_start=22
	key_start_alt=22
	key_opt=42
	key_opt_alt=224
	key_edit=44
	key_edit_alt=40
	key_delete=76
	key_reset=21

	[gamepad]
	; these need to be the decimal value of the SDL Controller buttons.
	; a table exists here: https://wiki.libsdl.org/SDL_GameControllerButton
	gamepad_up=11
	gamepad_left=13
	gamepad_down=12
	gamepad_right=14
	gamepad_select=4
	gamepad_start=6
	gamepad_opt=0
	gamepad_edit=1
	`

-----------------------------------------------------------

# SHELL TIPS
	```sh
	for i in *.png
	do
	mv $i $i.jpg
	done

	sudo !!

	ctrl a = begin
	ctrl e = end

	convert file.{jpg, png}
	parallel convert '{}' '{.}.jpg' ::: *.rw2
	```

-----------------------------------------------------------

# NES CONTROLLER
	[DIRECT INPUT] Plug in, start select a
	[XBOX INPUT] Plug in, start select b
	[PAIRING MODE] start select up
	[TURBO] sel a b

-----------------------------------------------------------

# BROWSERS
### UNGOOGLED CHROMIUM
	https://github.com/ungoogled-software/ungoogled-chromium-archlinux

### FIREFOX

resisFingerPrinting False to fix animation

# check arkenfox user.js template profile

about:config : gfx.webrender.all to true

	# PRIVACY
	https://www.youtube.com/watch?v=F7-bW2y6lcI

	- SCALE UI > about:config layout.css.devPixelsPerPx
	- CUSTOM UI
	  /home/wsz/.mozilla/b98bb2zk.default-release/chrome/userChrome.css
		```css
		#tabbrowser-tabs, #tabbrowser-tabs arrowscrollbox { min-height: 0 !important; }
		#tabbrowser-tabs tab { height: var(--tab-min-height); }
		#tabbrowser-tabs tab:first-of-type:last-of-type { display: none !important; }

		/* HIDE COMPLETELY */
		/*#main-window[chromehidden*="toolbar"] #nav-bar {*/
		/*visibility: collapse;*/
		/*}*/
		/*#TabsToolbar { visibility: collapse !important; }*/

		#nav-bar {
			min-height: 0 !important;
			max-height: 0 !important;
		height: 0 !important;
				--moz-transform: scaleY(0) !important;
		transform: scaleY(0) !important;
		transition: all 0.1s ease !important;
		}

		/* Thanks to /u/Ynjxsjmh/ for #nav-bar:focus-within
		#titlebar:hover~#nav-bar,
		#nav-bar:hover,
		#nav-bar:focus-within {
		--moz-transform: scale(1) !important;
		transform: scale(1) !important;
		max-height: 36px !important;
		height: 36px !important;
		min-height: 36px !important;
		}
		```
-----------------------------------------------------------
#tabbrowser-tabs, #tabbrowser-tabs arrowscrollbox { min-height: 0 !important; }
#tabbrowser-tabs tab { height: var(--tab-min-height); }
#tabbrowser-tabs tab:first-of-type:last-of-type { display: none !important; }


/* HIDE COMPLETELY */
/*#main-window[chromehidden*="toolbar"] #nav-bar {*/
  /*visibility: collapse;*/
/*}*/
/*#TabsToolbar { visibility: collapse !important; }*/

@namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul"); /* only needed once */

/* remove all items from the urlbar drop down */
#PopupAutoCompleteRichResult {display:none !important;}

  #urlbar .search-one-offs:not([hidden]) {
    display: none !important;
  }


#PopupAutoCompleteRichResult {
  display: none!important;
}

 #nav-bar {
     min-height: 0 !important;
     max-height: 0 !important;
     height: 0 !important;
     --moz-transform: scaleY(0) !important;
     transform: scaleY(0) !important;
     transition: all 0.1s ease !important;
 }

/*Thanks to /u/Ynjxsjmh/ for #nav-bar:focus-within*/
 #titlebar:hover~#nav-bar,
 #nav-bar:hover,
 #nav-bar:focus-within {
     --moz-transform: scale(1) !important;
     transform: scale(1) !important;
     max-height: 36px !important;
     height: 36px !important;
     min-height: 36px !important;
 }

-----------------------------------------------------------
