{pkgs, ...}:

{
  services.openssh.enable = true;

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

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;

  services.gvfs.enable = true;
}