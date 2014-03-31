require 'erb'
require 'aws_generate_cloudformation/subnets'

class AwsGenerateCloudformation
  # creates a full VPC cloudformation template
  class VPC
    def initialize(vpc=nil, vpc_config=nil)
      @vpc = vpc
      @vpc_config = vpc_config
      @subnets ||= Subnets.new(vpc_config)
    end

    def vpc_config
      @vpc_config
    end

    def erb_template
      path = File.expand_path('../../erb/vpc.erb', File.dirname(__FILE__))
      File.read(path)
    end

    def create_template
      erb = ERB.new(erb_template, nil, '-')
      template =  erb.result(binding)
      template.to_s
    end

    def subnet_resources
      @subnets.subnet_resources
    end

    def cidr_block
      if vpc_config.has_key?('cidr_block')
        vpc_config['cidr_block']
      else
        '10.99.0.0' + vpc_config['cidr_size']
      end
    end

    def vpc_type
      @vpc
    end

    def subnets_template_outputs
    end
  end
end
