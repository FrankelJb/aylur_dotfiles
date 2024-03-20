{ config, pkgs, ... }: {
  environment = {
    sessionVariables = {
      NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
    };

    pathsToLink = [
      "/share/nautilus-python/extensions"
    ];

    systemPackages = with pkgs; [
      qogir-icon-theme
      gnome-extension-manager
      nautilus-open-any-terminal
      gnome.nautilus-python
      wl-clipboard
    ];

    gnome.excludePackages = (with pkgs; [
      # gnome-text-editor
      gnome-console
      gnome-photos
      gnome-tour
      gnome-connections
      snapshot
      gedit
    ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      epiphany # web browser
      evince # document viewer
      gnome-characters
      yelp # Help view
      gnome-contacts
      gnome-initial-setup
      gnome-shell-extensions
      gnome-maps
      gnome-font-viewer
    ]);
  };

  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      extraGSettingsOverridePackages = [
          pkgs.nautilus-open-any-terminal
      ];
    };
  };

  programs.dconf.profiles = {
    gdm.databases = [{
      settings = {
        "org/gnome/desktop/interface" = {
          cursor-theme = "Qogir";
        };
      };
    }];
  };
}
