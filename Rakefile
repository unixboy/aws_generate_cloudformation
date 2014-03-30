require 'bundler/gem_tasks'
require 'rake/testtask'
require 'cane/rake_task'
require 'tailor/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format doc', '--color']
end

desc 'Run all test suites'
task :test => :spec

desc 'Run cane to check quality metrics'
Cane::RakeTask.new do |cane|
  cane.canefile = './.cane'
end

Tailor::RakeTask.new

desc 'Display LOC stats'
task :stats do
  puts "\n## Production Code Stats"
  sh 'countloc -r lib'
  puts "\n## Test Code Stats"
  sh 'countloc -r spec'
end

task :default => [:test, :cane, :tailor, :stats]
