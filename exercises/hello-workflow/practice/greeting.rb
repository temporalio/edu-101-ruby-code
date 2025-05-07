require 'temporalio/workflow'

class GreetSomeone < Temporalio::Workflow::Definition
  def execute(name)
    "Hello #{name}"
  end
end

