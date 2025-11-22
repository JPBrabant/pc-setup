// user.js
// This file sets preferences that are applied at Firefox startup.
// Do NOT edit `prefs.js` directly while Firefox is running; instead
// modify this file to persist preferences across restarts.

// What is shown at startup
// 0 = blank page, 1 = home page (default), 2 = last visited page, 3 = resume the previous browser session
// https://kb.mozillazine.org/Browser.startup.page
user_pref("browser.startup.page", 3);

// Show the Window Title Bar (draw the tab over the title bar area)
// 0 = Show title bar, 1 = Hide title bar (default)
// https://searchfox.org/firefox-release/source/modules/libpref/init/StaticPrefList.yaml#1929
user_pref("browser.tabs.inTitlebar", 0);

// New side bar with tab on the side
user_pref("sidebar.revamp", true);
user_pref("sidebar.verticalTabs", true);
user_pref("sidebar.verticalTabs.dragToPinPromo.dismissed", true);
user_pref("sidebar.main.tools", "history,bookmarks");
user_pref("sidebar.visibility", "always-show");