require_relative '../../spec_helper.rb'

describe AwsGenerateCloudformation::Subnets do
  before(:each) do
    vpc_config = {
      'cidr_block' => '10.0.0.0/24',
      'subnets' => {
        'Public' => {
          'acl' => 'bastion',
          'instances' => ['admin'],
          'network' => '10.0.0.0/24'
        }
      }
    }
    @subnets = AwsGenerateCloudformation::Subnets.new(vpc_config)
  end

  describe "#subnet_resources" do
    it "returns string with content" do
      @subnets.subnet_resources.should match(/[a-z]/)
    end
  end
end
