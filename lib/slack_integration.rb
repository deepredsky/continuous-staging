# https://hooks.slack.com/services/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

require 'httparty'
require_relative 'integration'

class SlackIntegration < Integration
  include HTTParty
  base_uri 'https://hooks.slack.com'
  debug_output

  def payload
    {
      payload: "#{{ text: message(:text), username: from }.to_json}"
    }
  end

  def update
    self.class.post('/services/T0292J1CX/B034CHXGF/F36QTHRULZUvqXujUFMiT41f', body: payload)
  end
end
