require 'spec_helper'

describe UserAgent::Browsers::Opera do

  describe "comparisons" do
    before(:all) do
      @opera_9_26 = UserAgent.parse("Opera/9.26 (Macintosh; Intel Mac OS X; U; en)")
      @opera_9_27 = UserAgent.parse("Opera/9.27 (Windows NT 5.1; U; en)")
      @opera_9_28 = UserAgent.parse("Opera/9.28 (Windows NT 5.1; U; en)")
    end

    specify { @opera_9_27.should_not == @opera_9_26 }
    specify { @opera_9_27.should_not <  @opera_9_26 }
    specify { @opera_9_27.should_not <= @opera_9_26 }
    specify { @opera_9_27.should     >  @opera_9_26 }
    specify { @opera_9_27.should     >= @opera_9_26 }

    specify { @opera_9_27.should     == @opera_9_27 }
    specify { @opera_9_27.should_not <  @opera_9_27 }
    specify { @opera_9_27.should     <= @opera_9_27 }
    specify { @opera_9_27.should_not >  @opera_9_27 }
    specify { @opera_9_27.should     >= @opera_9_27 }

    specify { @opera_9_27.should_not == @opera_9_28 }
    specify { @opera_9_27.should     <  @opera_9_28 }
    specify { @opera_9_27.should     <= @opera_9_28 }
    specify { @opera_9_27.should_not >  @opera_9_28 }
    specify { @opera_9_27.should_not >= @opera_9_28 }
  end

  describe "Macintosh / Opera" do
    it_should_behave_like "opera browser on Macintosh", "Opera/9.27 (Macintosh; Intel Mac OS X; U; en)", "9.27", "Intel Mac OS X", "en"
  end

  describe "Windows / Opera" do
    it_should_behave_like "opera browser on Windows", "Opera/9.27 (Windows NT 5.1; U; en)", "9.27", "XP", "en"
  end

end
