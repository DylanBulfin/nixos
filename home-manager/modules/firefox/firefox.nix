{ ... }:

{
  programs.firefox.enable = true;

  programs.firefox.profiles.dylan = {
    userChrome = ''
      #TabsToolbar {
          display: none !important;
      }
    '';

    settings = {
      "browser.sessionstore.max_resumed_crashes" = 0;
      "browser.sessionstore.resume_from_crash" = false;

      "extensions.activeThemeID" = "firefox-compact-light@mozilla.org";
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };
  };
}
