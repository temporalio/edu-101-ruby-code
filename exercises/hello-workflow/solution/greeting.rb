require 'temporalio/workflow'

module GreetSomeone
  class GreetingWorkflow < Temporalio::Workflow::Definition
    def execute(name)
      "Hello #{name}"
    end
  end
end
