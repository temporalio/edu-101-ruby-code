# frozen_string_literal: true

require 'temporalio/activity'
require 'net/http'

class GreetInSpanish < Temporalio::Activity::Definition
  def execute(name)
    call_service('get-spanish-greeting', name)
  end
end

class FarewellInSpanish < Temporalio::Activity::Definition
  def execute(name)
    call_service('get-spanish-farewell', name)
  end
end

# Utility method for making calls to the microservices
def call_service(stem, name)
  base = "http://localhost:9999/#{stem}"
  url = "#{base}?name=#{name}"
  response = Net::HTTP.get_response(URI(url))
  response.body
end
