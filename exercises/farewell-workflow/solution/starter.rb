# frozen_string_literal: true

require 'temporalio/client'
require_relative 'workflow'

all_args = ARGV

# Create a client
client = Temporalio::Client.connect('localhost:7233', 'default')

# Run workflow
puts 'Executing workflow'
result = client.execute_workflow(
  GreetingFarewell::GreetSomeoneWorkflow,
  first_arg = ARGV[0],
  id: 'greeting-workflow',
  task_queue: 'greeting-tasks'
)
puts "Result: #{result}"
