{ pkgs, ... }:
{
  xdg.desktopEntries = {
    "lf" = {
      name = "lf";
      noDisplay = true;
    };
  };

  home.packages = with pkgs; with gnome; [
    # colorscript
    (import ./colorscript.nix { inherit pkgs; })

    # gui
    (mpv.override { scripts = [mpvScripts.mpris]; })
    libreoffice
    caprine-bin
    d-spy
    gimp
    icon-library
    dconf-editor

    # tools
    bat
    fd
    fzf
    glib
    killall
    libnotify
    lsd
    ripgrep
    steam-run # fhs envs
    unzip
    zip

    # fun
    glow
    slides
    yabridge
    yabridgectl
    wine-staging
  ];
}
