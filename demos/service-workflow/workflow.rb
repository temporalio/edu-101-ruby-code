require 'temporalio/workflow'
require_relative 'activities'

class GreetSomeone < Temporalio::Workflow::Definition
  def execute(name)
    Temporalio::Workflow.execute_activity(
      GreetInSpanish,
      name,
      start_to_close_timeout: 5
    )
  end
end

