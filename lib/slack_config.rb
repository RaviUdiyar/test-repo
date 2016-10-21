module Slackistrano
  class CustomMessaging < Messaging::Helpers
    def username
      "Deploy Bot"
    end

    def icon_url
      ENV["SLACK_BOT_ICON"] || "https://octodex.github.com/images/labtocat.png"
    end
  end
end
