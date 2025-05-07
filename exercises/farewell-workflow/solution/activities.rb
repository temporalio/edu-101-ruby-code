require 'temporalio/activity'
require 'net/http'

module GreetingFarewell
  class GreetInSpanishActivity < Temporalio::Activity::Definition
    def execute(name)
      GreetingFarewell.call_service('get-spanish-greeting', name)
    end
  end

  class FarewellInSpanishActivity < Temporalio::Activity::Definition
    def execute(name)
      GreetingFarewell.call_service('get-spanish-farewell', name)
    end
  end

  # Utility method for making calls to the microservices
  def self.call_service(stem, name)
    base = "http://localhost:9999/#{stem}"
    url = "#{base}?name=#{name}"
    response = Net::HTTP.get_response(URI(url))
    response.body
  end
end
