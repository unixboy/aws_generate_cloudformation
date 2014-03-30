require 'aws_generate_cloudformation/version'
require 'aws_generate_cloudformation/config'
require 'aws_generate_cloudformation/vpc'
require 'aws-sdk-core'

# generates and instantiates cloudformation templates
class AwsGenerateCloudformation
  def initialize(output=STDOUT, config_yml)
    @output = output
    @config = Config.new(config_yml)
  end

  def generate
    @output.puts create_vpc_templates
  end

  def create_vpc_templates
    templates = ''
    @config.vpcs.each do |vpc, vpc_config|
      templates << VPC.new(vpc, vpc_config).create_template
    end
    templates
  end
end
