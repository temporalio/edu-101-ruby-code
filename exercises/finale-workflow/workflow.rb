require 'temporalio/workflow'

module CertificateGenerator
  class CertificateGeneratorWorkflow < Temporalio::Workflow::Definition
    def execute(name)
      result = Temporalio::Workflow.execute_activity(
        'CreatePdf',
        name,
        start_to_close_timeout: 5
      )
    end
  end
end
