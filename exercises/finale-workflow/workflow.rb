# frozen_string_literal: true

require 'temporalio/workflow'

class CertificateGenerator < Temporalio::Workflow::Definition
  def execute(name)
    Temporalio::Workflow.execute_activity(
      'CreatePdf',
      name,
      start_to_close_timeout: 5
    )
  end
end
