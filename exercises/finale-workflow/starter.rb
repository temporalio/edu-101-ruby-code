# frozen_string_literal: true

require 'temporalio/client'
require_relative 'workflow'

all_args = ARGV

# Create a client
client = Temporalio::Client.connect('localhost:7233', 'default')

# Run workflow
puts 'Executing workflow'
result = client.execute_workflow(
  CertificateGenerator::CertificateGeneratorWorkflow,
  ARGV[0],
  id: 'generate-certificate-workflow',
  task_queue: 'generate-certificate-taskqueue'
)
puts "Workflow result: #{result}"
