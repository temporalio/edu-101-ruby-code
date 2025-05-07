# frozen_string_literal: true

require_relative 'workflow'
require 'temporalio/client'
require 'temporalio/worker'

# Create a Temporal client
client = Temporalio::Client.connect(
  'localhost:7233',
  'default',
)

# Create worker with the activities and workflow
worker = Temporalio::Worker.new(
  client:,
  task_queue: 'greeting-tasks',
  workflows: [GreetingFarewell::GreetSomeoneWorkflow],
  activities: [GreetingFarewell::GreetInSpanishActivity]
)

# Run the worker until SIGINT
puts 'Starting worker (ctrl+c to exit)'
worker.run(shutdown_signals: ['SIGINT'])