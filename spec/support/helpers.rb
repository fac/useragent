# =========
# = GECKO =
# =========
shared_examples_for "Gecko browser" do |user_agent_string, browser, version, gecko_version, platform, os, localization, mobile|
  user_agent = UserAgent.parse(user_agent_string)

  specify { user_agent.browser.should == browser }
  specify { user_agent.version.should == version }
  specify { user_agent.gecko.version.should == gecko_version }
  specify { user_agent.platform.should == platform }
  specify { user_agent.os.should == os }
  specify { user_agent.localization.should == localization }
  specify { user_agent.mobile?.should == mobile }
  specify { user_agent.security.should == :strong }
  specify { user_agent.should_not be_webkit }
end

shared_examples_for "Gecko browser on Macintosh" do |user_agent_string, browser, version, gecko_version, os, localization, mobile|
  it_should_behave_like "Gecko browser",
  user_agent_string,
  browser, version, gecko_version, "Macintosh", os, localization, mobile
end

shared_examples_for "Gecko browser on Windows" do |user_agent_string, browser, version, gecko_version, os, localization, mobile|
  it_should_behave_like "Gecko browser",
  user_agent_string,
  browser, version, gecko_version, "Windows", "Windows #{os}", localization, mobile
end

shared_examples_for "Gecko browser on X11" do |user_agent_string, browser, version, gecko_version, os, localization, mobile|
  it_should_behave_like "Gecko browser",
  user_agent_string,
  browser, version, gecko_version, "X11", os, localization, mobile
end

# =====================
# = INTERNET EXPLORER =
# =====================
shared_examples_for "internet explorer browser" do |user_agent_string, version, os, localization, mobile, chromeframe, chromeframe_version|
  user_agent = UserAgent.parse(user_agent_string)

  specify { user_agent.browser.should == "Internet Explorer" }
  specify { user_agent.version.should == version }
  specify { user_agent.platform.should == "Windows" }
  specify { user_agent.os.should == os }
  specify { user_agent.localization.should == localization }
  specify { user_agent.mobile?.should == mobile }
  specify { user_agent.compatibility.should == "compatible" }
  specify { user_agent.should be_compatible }
  specify { chromeframe == nil ? (user_agent.chromeframe.should be_nil) : (user_agent.chromeframe.should send("be_#{chromeframe}")) }
  specify { chromeframe_version.nil? ? (user_agent.chromeframe.should_not respond_to(:version)) : (user_agent.chromeframe.version.should == chromeframe_version) }
  specify { user_agent.should_not be_webkit }
end

shared_examples_for "internet explorer browser on Windows" do |user_agent_string, version, os, localization, mobile|
  it_should_behave_like "internet explorer browser",
  user_agent_string,
  version, "Windows #{os}", localization, mobile, nil, nil
end

shared_examples_for "internet explorer browser on Windows with chromeframe before version 4.0" do |user_agent_string, version, os, localization, mobile|
  it_should_behave_like "internet explorer browser",
  user_agent_string,
  version, "Windows #{os}", localization, mobile, true, nil
end

shared_examples_for "internet explorer browser on Windows with chromeframe from version 4.0" do |user_agent_string, version, os, localization, mobile, chromeframe_version|
  it_should_behave_like "internet explorer browser",
  user_agent_string,
  version, "Windows #{os}", localization, mobile, true, chromeframe_version
end

# =========
# = OPERA =
# =========
shared_examples_for "opera browser" do |user_agent_string, version, platform, os, localization, mobile|
  user_agent = UserAgent.parse(user_agent_string)

  specify { user_agent.browser.should == "Opera" }
  specify { user_agent.version.should == version }
  specify { user_agent.platform.should == platform }
  specify { user_agent.os.should == os }
  specify { user_agent.localization.should == localization }
  specify { user_agent.should_not be_mobile }
  specify { user_agent.security.should == :strong }
  specify { user_agent.should_not be_webkit }
end

shared_examples_for "opera browser on Macintosh" do |user_agent_string, version, os, localization|
  it_should_behave_like "opera browser",
  user_agent_string,
  version, "Macintosh", os, localization
end

shared_examples_for "opera browser on Windows" do |user_agent_string, version, os, localization|
  it_should_behave_like "opera browser",
  user_agent_string,
  version, "Windows", "Windows #{os}", localization
end

# ==========
# = WEBKIT =
# ==========
shared_examples_for "Webkit browser" do |user_agent_string, browser, build, version, webkit_version, platform, os, localization, mobile|
  user_agent = UserAgent.parse(user_agent_string)

  specify { user_agent.browser.should == browser }
  specify { user_agent.build.should == build }
  specify { user_agent.version.should == version }
  specify { user_agent.webkit.version.should == webkit_version }
  specify { user_agent.platform.should == platform }
  specify { user_agent.os.should == os }
  specify { user_agent.localization.should == localization }
  specify { user_agent.mobile?.should == mobile }
  specify { user_agent.security.should == :strong }
  specify { user_agent.should be_webkit }
end

shared_examples_for "Webkit browser on Macintosh" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "Macintosh", os, localization, false
end

shared_examples_for "Webkit browser on iPhone" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "iPhone", os, localization, true
end

shared_examples_for "Webkit browser on iPhone Simulator" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "iPhone Simulator", os, localization, true
end

shared_examples_for "Webkit browser on iPod" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "iPod", os, localization, true
end

shared_examples_for "Webkit browser on iPad" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "iPad", os, localization, true
end

shared_examples_for "Webkit browser on Windows" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "Windows", "Windows #{os}", localization, false
end

shared_examples_for "Webkit browser on webOS" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "webOS", os, localization, true
end

shared_examples_for "Webkit browser on Linux" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "Linux", os, localization, true
end

shared_examples_for "Webkit browser on BlackBerry" do |user_agent_string, browser, build, version, webkit_version, os, localization|
  it_should_behave_like "Webkit browser",
  user_agent_string,
  browser, build, version, webkit_version, "BlackBerry", os, localization, true
end
