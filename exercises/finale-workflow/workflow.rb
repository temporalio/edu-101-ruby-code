require 'temporalio/workflow'


class CertificateGenerator < Temporalio::Workflow::Definition
  def execute(name)
    result = Temporalio::Workflow.execute_activity(
      'CreatePdf',
      name,
      start_to_close_timeout: 5
    )
  end
end

