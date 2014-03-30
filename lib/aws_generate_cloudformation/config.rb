require 'yaml'

class AwsGenerateCloudformation
  # loads config.yml file for cloudformation parameters
  class Config
    attr_reader :yml, :vpcs, :acls, :instance_types, :keyname

    def initialize(yml_file)
      dir = File.dirname(__FILE__)
      @yml = YAML.load_file(yml_file)
      @vpcs = @yml['vpcs']
      @acls = @yml['acls']
      @instance_types = @yml['instance_types']
      @keyname = @yml['global']['keyname']
    end

  end
end
