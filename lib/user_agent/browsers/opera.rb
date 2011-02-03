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
            ua.comment.detect { |comm| comm =~ /Opera Mini/i }.split('/')[1]
          
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
        if platform == "Linux"
          application.comment.detect { |c| c =~ /^#{platform}/i }

        elsif platform == "Windows"
          detect_name_and_version_from(OperatingSystems::REGEXP_AND_NAMES)

        elsif detect_user_agent_by_comment(/^macintosh/i)
          application.comment[1]

        elsif platform == "Android" || detect_user_agent_by_comment(/^mac/i)
          application.comment[0].sub(/mac\s*/i, "")

        else
          nil
        end
      end

      def language
        # Handle language that is not the last part of comment
        # e.g.: Mozilla/5.0 (Windows NT 5.1; U; de; rv:1.8.0) Gecko/20060728 Firefox/1.5.0 Opera 9.23
        if application.comment
          application.comment.last =~ /^rv:/ ? application.comment[application.comment.size-2] : application.comment.last
        else
          super
        end
      end

      def security
        case platform
        when "Windows", "Nintendo Wii"
          SECURITY[application.comment[1]]
        when "Macintosh", "Linux"
          SECURITY[application.comment[2]]
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
