require 'spec_helper'

describe UserAgent::Browsers::All do
  before(:all) do
    @ie_7    = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)")
    @ie_6    = UserAgent.parse("Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)")
    @firefox = UserAgent.parse("Mozilla/5.0 (Macintosh; U; Intel Mac OS X; en-US; rv:1.8.1.14) Gecko/20080404 Firefox/2.0.0.14")
  end

  describe "#<" do
    specify { @ie_7.should_not < "Mozilla" }
    specify { @ie_7.should_not < @firefox }
    specify { @ie_6.should     < @ie_7 }
    specify { @ie_6.should_not < @ie_6 }
    specify { @ie_7.should_not < @ie_6 }
  end

  describe "#<=" do
    specify { @ie_7.should_not <= "Mozilla" }
    specify { @ie_7.should_not <= @firefox }
    specify { @ie_6.should     <= @ie_7 }
    specify { @ie_6.should     <= @ie_6 }
    specify { @ie_7.should_not <= @ie_6 }
  end

  describe "#==" do
    specify { @ie_7.should_not == "Mozilla" }
    specify { @ie_7.should_not == @firefox }
    specify { @ie_6.should_not == @ie_7 }
    specify { @ie_6.should     == @ie_6 }
    specify { @ie_7.should_not == @ie_6 }
  end

  describe "#>" do
    specify { @ie_7.should_not > "Mozilla" }
    specify { @ie_7.should_not > @firefox }
    specify { @ie_6.should_not > @ie_7 }
    specify { @ie_6.should_not > @ie_6 }
    specify { @ie_7.should     > @ie_6 }
  end

  describe "#>=" do
    specify { @ie_7.should_not >= "Mozilla" }
    specify { @ie_7.should_not >= @firefox }
    specify { @ie_6.should_not >= @ie_7 }
    specify { @ie_6.should     >= @ie_6 }
    specify { @ie_7.should     >= @ie_6 }
  end

end
