class UserAgent
  module OperatingSystems

    REGEXP_AND_NAMES = [
      [%r{Windows\s*NT\s*6\.1}i,      "Windows 7"],
      [%r{Windows\s*NT\s*6\.?0?}i,    "Windows Vista"],
      [%r{Windows\s*NT\s*5\.2}i,      "Windows Server 2003"],
      [%r{Windows\s*NT\s*5\.1}i,      "Windows XP"],
      [%r{Windows\s*NT\s*5\.01}i,     "Windows 2000, Service Pack 1 (SP1)"],
      [%r{Windows\s*NT\s*5\.[3-9]}i,  "Windows NT"],
      [%r{Windows\s*NT\s*4\.?0?}i,    "Windows NT 4.0"],
      [%r{Win\s*NT\s*4\.?0?}i,        "Windows NT 4.0"],
      [%r{Win\s*NT}i,                 "Windows NT"],
      [%r{Windows\s*NT\s*5\.?0?}i,    "Windows 2000"],
      [%r{Win 9x\s*.*}i,              "Windows Me"], # Windows Millennium Edition
      [%r{Win\s*(9[58])}i,            "Windows"], # Windows 95 & 98
      [%r{Windows\s*(9[58])}i,        "Windows"], # Windows 95 & 98
      [%r{Windows\s*(.*)}i,           "Windows"], # All other Windows
      [%r{FreeBSD[-/\s]?(.*)}i,       "FreeBSD"],
      [%r{OpenBSD[-/\s]?(.*)}i,       "OpenBSD"],
      [%r{NetBSD[-/\s]?(.*)}i,        "NetBSD"],
      [%r{SunOS[-/\s]?(.*)}i,         "SunOS"],
      [%r{BeOS[-/\s]?(.*)}i,          "BeOS"],
      [%r{OS/2[-/\s]?(.*)}i,          "OS/2"],
      [%r{WebTV[-/\s]?(.*)}i,         "WebTV"],
      [%r{Linux\s*(.*)}i,             "Linux"],
      [%r{AmigaOS}i,                  "AmigaOS"],
      [%r{BlackBerry}i,               "BlackBerryOS"],
      [%r{Nintendo\s+DS[-/\s]?(.*)}i, "Nintendo DS"]
    ]

  end
end
