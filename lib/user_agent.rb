require 'user_agent/comparable'
require 'user_agent/browsers'
require 'user_agent/linux_distributions'
require 'user_agent/operating_systems'
require 'user_agent/platforms'
require 'user_agent/languages'
require 'user_agent/countries'

class UserAgent
  
  # Useful links
  # User Agent strings parsing method:
  #   http://www.texsoft.it/index.php?m=sw.php.useragent
  # 
  # User Agent strings parsing examples:
  #   http://useragentstring.com/
  #   http://www.zytrax.com/tech/web/browser_ids.htm
  #   http://www.useragents.org/database.asp
  #   http://useragent.xtractpro.com/
  #   http://www.botsvsbrowsers.com
  # 
  # This list could be used for future improvements on mobile devices detection:
  #   http://en.wikipedia.org/wiki/List_of_user_agents_for_mobile_phones
  # 
  # Useful to see which browsers detection need to be rock-solid (IE, Firefox, Chrome, Safari, Opera, Mobiles):
  #   http://en.wikipedia.org/wiki/Usage_share_of_web_browsers
  
  MATCHER = %r{
    ^([^\/\s]*)                       # Product token
    (\s*\/([^\s()]*)(\s?PPC)?)?       # Optional version
    \s*                               # Eat spaces
    (\((([^()]|(\([^()]*\)))*)\))?\s* # Optional comment within parenthesis, allow one level of parenthesis inside the comment
  }x

  def self.parse(string)
    agents = []
    unless string.nil?
      parenthesis_to_repair = string.count('(') - string.count(')')
      string += ')' * parenthesis_to_repair if parenthesis_to_repair > 0
      while !string.nil? && !string.empty? && m = string.to_s.match(MATCHER)
        agents << new(m[1], m[3], m[6])
        string = string.sub(m[0], '').strip
      end
      Browsers.extend(agents)
    end
    agents
  end

  attr_reader :product, :version, :comment

  def initialize(product, version=nil, comment=nil)
    if product
      @product = product
    else
      raise ArgumentError, "expected a value for product"
    end

    if version && !version.empty?
      @version = version
    else
      @version = nil
    end

    if comment.respond_to?(:split)
      @comment = comment.split(";").map(&:strip).reject { |c| c.empty? }
    else
      @comment = comment
    end
  end

  include Comparable

  # Any comparsion between two user agents with different products will
  # always return false.
  def <=>(other)
    if @product == other.product
      if @version && other.version
        @version <=> other.version
      else
        0
      end
    else
      false
    end
  end

  def eql?(other)
    @product == other.product &&
      @version == other.version &&
      @comment == other.comment
  end

  def to_str
    if @product && @version && @comment
      "#{@product}/#{@version} (#{@comment.join("; ")})"
    elsif @product && @version
      "#{@product}/#{@version}"
    elsif @product && @comment
      "#{@product} (#{@comment.join("; ")})"
    else
      @product
    end
  end
  alias :to_s :to_str

end
