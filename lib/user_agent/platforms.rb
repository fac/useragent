class UserAgent
  module Platforms

    REGEXP_AND_NAMES = [
      [/nintendo\s+wii/i,     "Nintendo Wii"],
      [/nintendo\s+ds/i,      "Nintendo DS"],
      [/webtv/i,              "WebTV"],
      [/win(dows)?/i,         "Windows"],
      [/ipad/i,               "iPad"],
      [/ipod/i,               "iPod"],
      [/iphone\s*simulator/i, "iPhone Simulator"],
      [/iphone/i,             "iPhone"],
      [/sunos/i,              "SunOS"],
      [/webos/i,              "webOS"],
      [/mac/i,                "Macintosh"],
      [/android/i,            "Android"],
      [/freebsd/i,            "FreeBSD"],
      [/openbsd/i,            "OpenBSD"],
      [/netbsd/i,             "NetBSD"],
      [/linux/i,              "Linux"],
      [/nokia/i,              "Nokia"],
      [/blackberry/i,         "BlackBerry"],
      [/opensolaris/i,        "OpenSolaris"],
      [/os\/2/i,              "OS/2"],
      [/beos/i,               "BeOS"],
      [/aix/i,                "AIX"],
      [/x11/i,                "X11"]
    ]

  end
end
