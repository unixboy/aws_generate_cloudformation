#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'aws_generate_cloudformation'

$LOAD_PATH << File.expand_path(File.dirname(__FILE__)) + "/../lib"

AwsGenerateCloudformation.new.generate
