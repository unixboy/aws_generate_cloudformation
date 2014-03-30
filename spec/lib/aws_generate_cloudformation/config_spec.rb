require_relative '../../spec_helper.rb'

describe AwsGenerateCloudformation::Config do
  describe "#new" do
    it "fails without config.yml" do
      expect { AwsGenerateCloudformation::Config.new}.to raise_error
    end

    it "loads config file from custom location" do
      test_yml_file = AwsGenerateCloudformation::Test::TEST_YML_FILE
      expect {
        AwsGenerateCloudformation::Config.new(test_yml_file)
      }.to_not raise_error
    end
  end
end
