class UserAgent
  module Browsers
    module Opera

      OPERA_BROWSERS = [
        "Opera Mini",
        ["Opera Mobi", "Opera Mobile"]
      ]

      def self.extend?(agent)
        !agent.detect_user_agent_by_product(/^opera/i).nil?
      end

      def type
        case platform
        when "Nintendo Wii"
          :console
        else
          :browser
        end
      end

      def browser
        browser_info = OPERA_BROWSERS.detect { |browser| detect_user_agent_by_product_or_comment(browser.is_a?(Array) ? browser[0] : browser) }
        if browser_info
          browser_info.is_a?(Array) ? browser_info[1] : browser_info
        else
          "Opera"
        end
      end

      def version
        if browser == "Opera Mini" && ua = detect_user_agent_by_comment(/Opera Mini/i)
            ua.comment.detect { |comm| comm =~ /Opera Mini/i }.split('/')[1].split('(')[0].strip

        elsif product = detect_user_agent_by_product("Version")
          product.version

        elsif ua = detect_user_agent_by_product(/^opera/i)
          # Handle the non standard way of Opera to declare its version
          # e.g.: Mozilla/4.0 (compatible; MSIE 5.0; Windows NT 4.0) Opera 5.11 [en]
          ua.version.nil? ? last.product : ua.version

        else
          super
        end
      end

      def os
        if platform == "Linux" && ua = detect_user_agent_by_comment(/^#{platform}/i)
           ua.comment.detect { |comm| comm =~ /^#{platform}/i }

        elsif platform == "Windows"
          detect_name_and_version_from(OperatingSystems::REGEXP_AND_NAMES)

        # Handle iOS
        # Examples:
        #   CPU like Mac OS X => 'iOS'
        #   CPU iPhone OS 3_1_3 like Mac OS X => 'iOS 3.1.3'
        elsif ua = detect_user_agent_by_comment(/CPU.*like Mac OS X/i)
          ua.comment.detect { |comm| comm =~ /CPU (?:iPhone )?OS ([\d_]+) like Mac OS X/i }
          "iOS#{" #{$1.gsub(/_/, '.')}" unless !$1 || $1.strip.empty?}"

        elsif ua = detect_user_agent_by_comment(/^macintosh/i)
          ua.comment[1]

        elsif ua = detect_user_agent_by_comment(/android/i)
          ua.comment.detect { |comm| comm =~ /android\s*(.*)/i }
          "Android#{" #{$1}" unless !$1 || $1.strip.empty?}"

        elsif ua = detect_user_agent_by_comment(/^mac/i)
          ua.comment.detect { |comm| comm =~ /^mac/i }.sub(/mac\s*/i, "")

        else
          nil
        end
      end

      def security
        ua = detect { |ua| !ua.comment.nil? }
        
        if ua
          case platform
          when "Windows", "Nintendo Wii"
            SECURITY[ua.comment[1]]
          when "Macintosh", "Linux"
            SECURITY[ua.comment[2]]
          else
            super
          end
        else
          super
        end
      end

      def mobile?
        ["Opera Mini", "Opera Mobile"].include?(browser)
      end

    end
  end
end
