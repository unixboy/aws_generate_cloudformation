require_relative '../../spec_helper'

describe AwsGenerateCloudformation::VPC do
  describe '#new' do
    it 'requires vpc and vpc_config parameter' do
      expect {
        AwsGenerateCloudformation::VPC.new
      }.to raise_error
    end
  end
  describe '#create_template' do
    before(:each) do
      vpc = 'test'
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
      @VPC = AwsGenerateCloudformation::VPC.new(vpc, vpc_config)
    end
    it "should return a template string" do
      @VPC.create_template.should match(/[a-z]/)
    end

    it "should include an template version" do
      @VPC.create_template.should match(
        /\W+"AWSTemplateFormatVersion":\W+"\d\d\d\d-\d\d-\d\d"/
      )
    end
  end
end
