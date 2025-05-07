# frozen_string_literal: true

require 'temporalio/client'
require_relative 'workflow'

# Create a client
client = Temporalio::Client.connect('localhost:7233', 'default')

# Run workflow
puts 'Executing workflow'
result = client.execute_workflow(
  CertificateGenerator,
  ARGV[0],
  id: 'generate-certificate-workflow',
  task_queue: 'generate-certificate-taskqueue'
)
puts "Workflow result: #{result}"
