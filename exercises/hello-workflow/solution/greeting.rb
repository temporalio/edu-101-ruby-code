# frozen_string_literal: true

require 'temporalio/workflow'

class GreetSomeone < Temporalio::Workflow::Definition
  def execute(name)
    "Hello #{name}"
  end
end
