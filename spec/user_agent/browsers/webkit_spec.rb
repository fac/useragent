require 'spec_helper'

describe UserAgent::Browsers::Webkit do

  describe "comparisons" do
    before(:all) do
      @safari_419_3  = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3")
      @safari_525_18 = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18")
      @safari_526_8  = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8")
    end

    specify { @safari_525_18.should_not == @safari_419_3 }
    specify { @safari_525_18.should_not <  @safari_419_3 }
    specify { @safari_525_18.should_not <= @safari_419_3 }
    specify { @safari_525_18.should     >  @safari_419_3 }
    specify { @safari_525_18.should     >= @safari_419_3 }

    specify { @safari_525_18.should     == @safari_525_18 }
    specify { @safari_525_18.should_not <  @safari_525_18 }
    specify { @safari_525_18.should     <= @safari_525_18 }
    specify { @safari_525_18.should_not >  @safari_525_18 }
    specify { @safari_525_18.should     >= @safari_525_18 }

    specify { @safari_525_18.should_not == @safari_526_8 }
    specify { @safari_525_18.should     <  @safari_526_8 }
    specify { @safari_525_18.should     <= @safari_526_8 }
    specify { @safari_525_18.should_not >  @safari_526_8 }
    specify { @safari_525_18.should_not >= @safari_526_8 }
  end

  describe "Macintosh / Safari" do
    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-fr) AppleWebKit/85.7 (KHTML, like Gecko) Safari/85.5",
    "Safari", "85.7", "1.0", "85.7", "PPC Mac OS X", "fr-fr"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/124 (KHTML, like Gecko) Safari/125",
    "Safari", "124", "1.2", "124", "PPC Mac OS X", "en-us"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/125.5.7 (KHTML, like Gecko) Safari/125.12",
    "Safari", "125.5.7", "1.2.4", "125.5.7", "PPC Mac OS X", "en"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr-ch) AppleWebKit/312.1.1 (KHTML, like Gecko) Safari/312",
    "Safari", "312.1.1", "1.3", "312.1.1", "PPC Mac OS X", "fr-ch"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/312.5 (KHTML, like Gecko) Safari/312.3",
    "Safari", "312.5", "1.3.1", "312.5", "PPC Mac OS X", "en-us"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; fr) AppleWebKit/312.5.1 (KHTML, like Gecko) Safari/312.3.1",
    "Safari", "312.5.1", "1.3.1", "312.5.1", "PPC Mac OS X", "fr"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; es-es) AppleWebKit/312.5.2 (KHTML, like Gecko) Safari/312.3.3",
    "Safari", "312.5.2", "1.3.1", "312.5.2", "PPC Mac OS X", "es-es"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/312.8 (KHTML, like Gecko) Safari/312.6",
    "Safari", "312.8", "1.3.2", "312.8", "PPC Mac OS X", "en"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en-us) AppleWebKit/412.6 (KHTML, like Gecko) Safari/412.2",
    "Safari", "412.6", "2.0", "412.6", "PPC Mac OS X", "en-us"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/412.6.2 (KHTML, like Gecko) Safari/412.2.2",
    "Safari", "412.6.2", "2.0", "412.6.2", "PPC Mac OS X", "en"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en) AppleWebKit/419 (KHTML, like Gecko) Safari/419.3",
    "Safari", "419", "2.0.4", "419", "Intel Mac OS X", "en"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18",
    "Safari", "525.18", "3.1.1", "525.18", "Intel Mac OS X 10_5_3", "en-us"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_3; en-us) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8",
    "Safari", "526.9", "4.0dp1", "526.9", "Intel Mac OS X 10_5_3", "en-us"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_3; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16",
    "Safari", "533.16", "5.0", "533.16", "Intel Mac OS X 10_6_3", "en-us"

    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4",
    "Safari", "533.19.4", "5.0.3", "533.19.4", "Intel Mac OS X 10_6_5", "en-us"
  end

  describe "Macintosh / Chrome" do
    it_should_behave_like "Webkit browser on Macintosh",
    "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_5; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.231 Safari/534.10",
    "Chrome", "534.10", "8.0.552.231", "534.10", "Intel Mac OS X 10_6_5", "en-US"
  end

  describe "iPhone / Safari" do
    it_should_behave_like "Webkit browser on iPhone",
    "Mozilla/5.0 (iPhone; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419",
    "Safari", "420.1", "3.0", "420.1", "CPU like Mac OS X", "en"

    it_should_behave_like "Webkit browser on iPhone",
    "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16",
    "Safari", "528.18", "3.1.3", "528.18", "CPU iPhone OS 3_1_3 like Mac OS X", "en-us"

    it_should_behave_like "Webkit browser on iPhone",
    "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Mobile/8A306",
    "Safari", "532.9", "4.0.1", "532.9", "CPU iPhone OS 4_0_1 like Mac OS X", "en-us"

    it_should_behave_like "Webkit browser on iPhone",
    "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8B117 Safari/6531.22.7",
    "Safari", "532.9", "4.1", "532.9", "CPU iPhone OS 4_1 like Mac OS X", "en-us"
  end

  describe "iPhone Simulator / Safari" do
    it_should_behave_like "Webkit browser on iPhone Simulator",
    "Mozilla/5.0 (iPhone Simulator; U; CPU iPhone OS 4_0_1 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A306 Safari/6531.22.7",
    "Safari", "532.9", "4.0.1", "532.9", "CPU iPhone OS 4_0_1 like Mac OS X", "en-us"
  end

  describe "iPod / Safari" do
    it_should_behave_like "Webkit browser on iPod",
    "Mozilla/5.0 (iPod; U; CPU like Mac OS X; en) AppleWebKit/420.1 (KHTML, like Gecko) Version/3.0 Mobile/4A102 Safari/419",
    "Safari", "420.1", "3.0", "420.1", "CPU like Mac OS X", "en"

    it_should_behave_like "Webkit browser on iPod",
    "Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_3 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7E18 Safari/528.16",
    "Safari", "528.18", "3.1.3", "528.18", "CPU iPhone OS 3_1_3 like Mac OS X", "en-us"
  end

  describe "iPad / Safari" do
    it_should_behave_like "Webkit browser on iPad",
    "Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10",
    "Safari", "531.21.10", "3.2", "531.21.10", "CPU OS 3_2 like Mac OS X", "en-us"
  end

  describe "Windows / Safari" do
    it_should_behave_like "Webkit browser on Windows",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/525.18 (KHTML, like Gecko) Version/3.1.1 Safari/525.18",
    "Safari", "525.18", "3.1.1", "525.18", "XP", "en"

    it_should_behave_like "Webkit browser on Windows",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en) AppleWebKit/526.9 (KHTML, like Gecko) Version/4.0dp1 Safari/526.8",
    "Safari", "526.9", "4.0dp1", "526.9", "XP", "en"
  end

  describe "Windows / Chrome" do
    it_should_behave_like "Webkit browser on Windows",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/525.13 (KHTML, like Gecko) Chrome/0.0.2 Safari/525.13",
    "Chrome", "525.13", "0.0.2", "525.13", "XP", "en-US"

    it_should_behave_like "Webkit browser on Windows",
    "Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.2 (KHTML, like Gecko) Chrome/6.0",
    "Chrome", "533.2", "6.0", "533.2", "7", "en-US"
  end

  describe "webOS / webOS" do
    it_should_behave_like "Webkit browser on webOS",
    "Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pre/1.1",
    "webOS", "532.2", "1.0", "532.2", "Palm Pre 1.1", "en-US"

    it_should_behave_like "Webkit browser on webOS",
    "Mozilla/5.0 (webOS/1.4.0; U; en-US) AppleWebKit/532.2 (KHTML, like Gecko) Version/1.0 Safari/532.2 Pixi/1.1",
    "webOS", "532.2", "1.0", "532.2", "Palm Pixi 1.1", "en-US"
  end

  describe "Linux / Android" do
    it_should_behave_like "Webkit browser on Linux",
    "Mozilla/5.0 (Linux; U; Android 1.5; de-; HTC Magic Build/PLAT-RC33) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1",
    "Android", "528.5+", "3.1.2", "528.5+", "Android 1.5", "de-"

    it_should_behave_like "Webkit browser on Linux",
    "Mozilla/5.0 (Linux; U; Android 2.1-update1; en-us; Nexus One Build/ERE27) AppleWebKit/530.17 (KHTML, like Gecko) Version/4.0 Mobile Safari/530.17 Chrome/4.1.249.1025",
    "Android", "530.17", "4.0", "530.17", "Android 2.1-update1", "en-us"
  end

  describe "BlackBerry / Android" do
    it_should_behave_like "Webkit browser on BlackBerry",
    "Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en) AppleWebKit/534.1+ (KHTML, Like Gecko) Version/6.0.0.141 Mobile Safari/534.1+",
    "BlackBerry", "534.1+", "6.0.0.141", "534.1+", "BlackBerry 9800", "en"
  end

end
