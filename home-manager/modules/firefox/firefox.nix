{ ... }:

{
  programs.firefox.enable = true;

  programs.firefox.profiles.dylan = {

    userChrome= ''
      #TabsToolbar {
          display: none !important;
      }
    '';

    settings = {
      "extensions.activeThemeID" = "firefox-compact-light@mozilla.org";
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
