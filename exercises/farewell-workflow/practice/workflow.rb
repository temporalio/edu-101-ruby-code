# frozen_string_literal: true

require 'temporalio/workflow'
require_relative 'activities'

class GreetSomeoneWorkflow < Temporalio::Workflow::Definition
  def execute(name)
    greeting = Temporalio::Workflow.execute_activity(
      GreetInSpanish,
      name,
      start_to_close_timeout: 5
    )

    # TODO: Part C: Implement the call to the Activity that calls the `get-spanish-farewell` endpoint

    # TODO: Part C: Update this statement to include the result of both Activities
    "#{greeting}"
  end
end
