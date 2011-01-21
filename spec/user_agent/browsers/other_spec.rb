require 'spec_helper'

describe "UserAgent: 'Mozilla/4.0 (compatible)'" do
  before(:all) { @useragent = UserAgent.parse("Mozilla/4.0 (compatible)") }

  specify { @useragent.browser.should == "Mozilla" }
  specify { @useragent.version.should == "4.0" }
end

describe "UserAgent: 'amaya/9.51 libwww/5.4.0'" do
  before(:all) { @useragent = UserAgent.parse("amaya/9.51 libwww/5.4.0") }

  specify { @useragent.browser.should == "amaya" }
  specify { @useragent.version.should == "9.51" }
  specify { @useragent.libwww.version.should == "5.4.0" }
end
