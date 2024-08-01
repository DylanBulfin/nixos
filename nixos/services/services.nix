{ pkgs, ... }:

{
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;

  services.xserver = {
    xkb.layout = "us";
  };

  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    # desktopManager.gnome.enable = true;
  };

  services.gvfs.enable = true;
}
