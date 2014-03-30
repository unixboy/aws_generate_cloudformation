require 'aws-sdk-core'

class AwsGenerateCloudformation
  # validates cloudformation templates for syntax
  class Validate
    def initialize(template)
      @template = template
    end

    def validate
      cloudformation = Aws::CloudFormation::V20100515.new
      cloudformation.validate(template_body: @template)[:status_code]
    end

  end
end
