class UserAgent
  module Browsers
    module GooglebotMobile
      def self.extend?(agent)
        agent.detect_user_agent_by_product_or_comment('Googlebot-Mobile')
      end

      def browser
        "Googlebot-Mobile"
      end
      
      def version
        (application.product == 'Safari' &&
         application.comment &&
         application.comment[1]) ? 
         application.comment[1].sub("Googlebot-Mobile/", "") :
         application.version.sub(';', '')
      end

      def compatibility
        application.comment ? application.comment[0] : nil
      end

      def compatible?
        compatibility == "compatible"
      end

      def crawler?
        true
      end
      
      def mobile?
        true
      end
    end
  end
end
