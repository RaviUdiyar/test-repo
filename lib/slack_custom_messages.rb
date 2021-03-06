module Slackistrano
  class CustomMessaging < Messaging::Base

    # Supress updating message.
    def payload_for_updating
      {
        :attachments => [{
          :text    => super[:text],
          :color   => "warning"
        }]
      }
    end

    # Supress reverting message.
    def payload_for_reverting
      nil
    end

    # Fancy updated message.
    # See https://api.slack.com/docs/message-attachments
    def payload_for_updated
      {
        attachments: [{
          color: 'good',
          title: 'Integrations Application Deployed :boom::bangbang:',
          fields: [{
            title: 'Environment',
            value: stage,
            short: true
          }, {
            title: 'Branch',
            value: branch,
            short: true
          }, {
            title: 'Deployer',
            value: deployer,
            short: true
          }, {
            title: 'Time',
            value: elapsed_time,
            short: true
          }],
          fallback: super[:text]
        }]
      }
    end

    # Slightly tweaked failed message.
    # See https://api.slack.com/docs/message-formatting
    def payload_for_failed
      {
        :attachments => [{
          :text    => super[:text],
          :color   => "danger"
        }]
      }
    end

  end
end
