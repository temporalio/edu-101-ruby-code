# frozen_string_literal: true

require 'temporalio/workflow'
require_relative 'activities'

class GreetSomeone < Temporalio::Workflow::Definition
  def execute(name)
    greeting = Temporalio::Workflow.execute_activity(
      GreetInSpanish,
      name,
      start_to_close_timeout: 5
    )

    farewell = Temporalio::Workflow.execute_activity(
      FarewellInSpanish,
      name,
      start_to_close_timeout: 5
    )

    "#{greeting}\n#{farewell}"
  end
end
