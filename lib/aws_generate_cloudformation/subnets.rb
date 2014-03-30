require 'erb'

class AwsGenerateCloudformation
  # renders subnet resources for a given vpc
  class Subnets

    def initialize(vpc_config)
      @subnets = vpc_config['subnets']
    end

    def subnets
      @subnets
    end

    def subnet_resources
      template_text = ''
      subnets.each do |name, config|

        template_text << create_template(name, config)
      end
      template_text.chomp
    end

    def erb_template
      path = File.expand_path('../../erb/subnet.erb', File.dirname(__FILE__))
      File.read(path)
    end

    def create_template(name, subnet_config)
      erb = ERB.new(erb_template, nil, '-')
      erb.result(binding)
    end

    def set_subnet_cidr(config)
      if config.has_key?('network')
        config['network']
      else
        '10.0.0.0' + config['size']
      end
    end

    def set_subnet_name(name)
      name + 'Subnet'
    end

  end
end
