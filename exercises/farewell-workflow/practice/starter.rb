# frozen_string_literal: true

require 'temporalio/client'
require_relative 'workflow'

# Create a client
client = Temporalio::Client.connect('localhost:7233', 'default')

# Run workflow
puts 'Executing workflow'
result = client.execute_workflow(
  GreetSomeone,
  ARGV[0],
  id: 'greeting-workflow',
  task_queue: 'greeting-tasks'
)
puts "Result: #{result}"
