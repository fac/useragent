require 'spec_helper'

describe UserAgent::Browsers::Gecko do

  describe "Macintosh / Firefox" do
    it_should_behave_like "Gecko browser on Macintosh",
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:2.0b8) Gecko/20100101 Firefox/4.0b8", # parsed user agent string
    "Firefox", "4.0b8", "20100101", "Intel Mac OS X 10.6", nil, false                      # expected variables

    it_should_behave_like "Gecko browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13",
    "Firefox", "3.6.13", "20101203", "Intel Mac OS X 10.6", "en-US", false

    it_should_behave_like "Gecko browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14",
    "Firefox", "2.0.0.14", "20080404", "Intel Mac OS X", "en-US", false

    it_should_behave_like "Gecko browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12",
    "Firefox", "1.5.0.12", "20070508", "PPC Mac OS X Mach-O", "en-US", false
  end

  describe "Macintosh / Camino" do
    it_should_behave_like "Gecko browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en; rv:1.8.1.14) Gecko/20080409 Camino/1.6 (like Firefox/2.0.0.14)",
    "Camino", "1.6", "20080409", "Intel Mac OS X", "en", false
  end

  describe "Macintosh / SeaMonkey" do
    it_should_behave_like "Gecko browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.4) Gecko/20091017 SeaMonkey/2.0",
    "Seamonkey", "2.0", "20091017", "Intel Mac OS X 10.6", "en-US", false
  end

  describe "Windows / Firefox" do
    it_should_behave_like "Gecko browser on Windows",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14",
    "Firefox", "2.0.0.14", "20080404", "XP", "en-US", false

    it_should_behave_like "Gecko browser on Windows",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.12) Gecko/20070508 Firefox/1.5.0.12",
    "Firefox", "1.5.0.12", "20070508", "XP", "en-US", false
  end

  describe "X11 / Firefox" do
    it_should_behave_like "Gecko browser on X11",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008070206 Firefox/3.0.1",
    "Firefox", "3.0.1", "2008070206", "Linux i686", "en-US", false

    it_should_behave_like "Gecko browser on X11",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.0.4) Gecko/20060612 Firefox/1.5.0.4 Flock/0.7.0.17.1",
    "Firefox", "1.5.0.4", "20060612", "Linux i686", "en-US", false
  end

  describe "X11 / Iceweasel" do
    it_should_behave_like "Gecko browser on X11",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.8.1) Gecko/20061024 Iceweasel/2.0 (Debian-2.0+dfsg-1)",
    "Iceweasel", "2.0", "20061024", "Linux i686", "en-US", false
  end

end
