# frozen_string_literal: true

require 'temporalio/workflow'
require_relative 'translation_activities'

class GreetSomeone < Temporalio::Workflow::Definition
  def execute(name)
    retry_policy = Temporalio::RetryPolicy.new(
      initial_interval: 15,
      backoff_coefficient: 2.0,
      max_interval: 160,
      max_attempts: 100
    )

    Temporalio::Workflow.execute_activity(
      GreetInSpanish,
      name,
      start_to_close_timeout: 5,
      retry_policy: retry_policy
    )
  end
end
