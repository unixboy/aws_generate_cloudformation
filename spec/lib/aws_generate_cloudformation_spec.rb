require_relative '../spec_helper.rb'

describe AwsGenerateCloudformation do
  describe '#generate' do
    config_yml = AwsGenerateCloudformation::Spec::Support::TEST_YML_FILE
    let(:stdout) { double('stdout').as_null_object }
    let(:cloudformation) { AwsGenerateCloudformation.new(stdout, config_yml) }

    before do
      described_class.any_instance.stub(:stdout).and_return(stdout)
    end

    it 'should return templates' do
      stdout.should_receive(:puts).with(/AWSTemplateFormatVersion/)
      cloudformation.generate
    end
  end
end
