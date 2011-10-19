class UserAgent
  module Browsers
    module Googlebot
      def self.extend?(agent)
        agent.detect_user_agent_by_product_or_comment('Googlebot')
      end

      def browser
        "Googlebot"
      end

      def version
        (application.product == 'Mozilla' && 
         application.comment &&
         application.comment[1]) ? 
         application.comment[1].sub("Googlebot/", "") : 
         application.version 
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
    end
  end
end
