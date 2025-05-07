require 'temporalio/activity'
require 'net/http'

class GreetInSpanish < Temporalio::Activity::Definition
  def execute(name)
    url = "http://localhost:9999/get-spanish-greeting?name=#{name}"
    response = Net::HTTP.get_response(URI(url))
    response.body
  end
end

