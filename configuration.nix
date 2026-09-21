{ config, lib, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
    ];

  boot.loader.limine.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Travelmate";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

   environment.sessionVariables = {
     XCURSOR_SIZE = "24";
     XCURSOR_THEME = "macOS";
};

   nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Enable the X11 windowing system.
   services.xserver.enable = false;

   hardware.bluetooth = {
     enable = true;
     powerOnBoot = true;
};
  
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     jack.enable = true;
     wireplumber.enable = true;
   };

   services.udisks2.enable = true;

   services.upower.enable = true;

   services.power-profiles-daemon.enable = true;

   security.polkit.enable = true;

   programs.nm-applet.enable = true;

   hardware.graphics.enable = true;
  
  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.socrates = {
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     shell = pkgs.fish;
     packages = with pkgs; [
       tree
     ];
   };
   

   fonts.packages = with pkgs; [
     jetbrains-mono
     nerd-fonts.symbols-only
   ]; 

   programs.fish.enable = true;

   programs.firefox.enable = true;

   programs.uwsm = {
     enable = true;
     waylandCompositors = {
       sway = {
         prettyName = "SwayFX";
         comment = "Simple window-manager on wayland";
         binPath = "/run/current-system/sw/bin/sway";
    };
  };
};

   programs.sway = {
     enable = true;
     package = pkgs.swayfx;
     wrapperFeatures.gtk = true;
   };

   programs.nh = {
     enable = true;
     clean.enable = true;
     clean.extraArgs = "--keep-since 7d --keep 5";
     flake = "/etc/nixos";
   };

   xdg.portal = {
     enable = true;
     wlr.enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
   };
  
   environment.systemPackages = with pkgs; [
     git    
     firefox
     kitty
     fish
     vlc
     nautilus
     newt
     noctalia
     btop
     apple-cursor
     pavucontrol
     polkit_gnome
     grim
     slurp
     udiskie
     fastfetch
     obsidian
     helix
   ];

  nixpkgs.config.allowUnfree = true;

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

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
  
 system.stateVersion = "26.05";

}
