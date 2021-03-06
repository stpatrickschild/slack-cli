require "dotenv"
require "httparty"
require "awesome_print"

require_relative "recipient"

Dotenv.load

module SlackCLI
  class Channel < Recipient
    BASE_URL = "https://slack.com/api/channels.list?"

    attr_reader :topic, :member_count

    def initialize(topic, member_count, name, slack_id)
      super(slack_id: slack_id, name: name)
      @topic = topic
      @member_count = member_count
    end

    def print_details
      return { topic: topic, member_count: member_count, slack_id: slack_id, name: name }
    end
  end
end
