require 'temporalio/workflow'
require_relative 'activities'

module GreetingFarewell
  class GreetSomeoneWorkflow < Temporalio::Workflow::Definition
    def execute(name)
      greeting = Temporalio::Workflow.execute_activity(
        GreetingFarewell::GreetInSpanishActivity,
        name,
        start_to_close_timeout: 5
      )

      farewell = Temporalio::Workflow.execute_activity(
        GreetingFarewell::FarewellInSpanishActivity,
        name,
        start_to_close_timeout: 5
      )

      "#{greeting}\n#{farewell}"
    end
  end
end
