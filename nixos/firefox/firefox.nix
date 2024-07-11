{...}:
{
  programs.firefox.enable = true;
  programs.firefox.policies = {
    ExtensionSettings = {
      "vimium-c@gdh1995.cn" = {
        "installation_mode" = "force_installed";
        "install_url"= "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
      };
      "uBlock0@raymondhill.net" = {
        "installation_mode" = "force_installed";
        "install_url"= "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
      };
      "treestyletab@piro.sakura.ne.jp" = {
        "installation_mode" = "force_installed";
        "install_url"= "https://addons.mozilla.org/firefox/downloads/latest/tree-style-tab/latest.xpi";
      };
      "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
        "installation_mode" = "force_installed";
        "install_url"= "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
      };
    };
    PasswordManagerEnabled = false;
  };


}