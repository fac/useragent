require 'spec_helper'

describe "comparisons" do
  before(:all) do
    @ie_6 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @ie_5 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)")
    @ie_7 = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
  end

  specify { @ie_6.should_not == @ie_5 }
  specify { @ie_6.should_not <  @ie_5 }
  specify { @ie_6.should_not <= @ie_5 }
  specify { @ie_6.should     >  @ie_5 }
  specify { @ie_6.should     >= @ie_5 }

  specify { @ie_6.should     == @ie_6 }
  specify { @ie_6.should_not <  @ie_6 }
  specify { @ie_6.should     <= @ie_6 }
  specify { @ie_6.should_not >  @ie_6 }
  specify { @ie_6.should     >= @ie_6 }

  specify { @ie_6.should_not == @ie_7 }
  specify { @ie_6.should     <  @ie_7 }
  specify { @ie_6.should     <= @ie_7 }
  specify { @ie_6.should_not >  @ie_7 }
  specify { @ie_6.should_not >= @ie_7 }
end

describe UserAgent::Browsers::InternetExplorer do

  describe "Windows / Internet Explorer" do
    it_should_behave_like "internet explorer browser on Windows", "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0)",
    "8.0", "Vista", nil, false

    it_should_behave_like "internet explorer browser on Windows", "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)",
    "7.0", "Vista", nil, false

    it_should_behave_like "internet explorer browser on Windows", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)",
    "6.0", "XP", nil, false

    it_should_behave_like "internet explorer browser on Windows", "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.1)",
    "5.5", "XP", nil, false

    it_should_behave_like "internet explorer browser on Windows",
    "Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; SAMSUNG; SGH-i917)",
    "7.0", "Phone OS 7.0", nil, true

    it_should_behave_like "internet explorer browser on Windows with chromeframe before version 4.0",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; chromeframe)",
    "6.0", "XP", nil, false

    it_should_behave_like "internet explorer browser on Windows with chromeframe from version 4.0",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1) chromeframe/4.0",
    "6.0", "XP", nil, false, "4.0"
  end

end
