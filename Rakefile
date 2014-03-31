require 'bundler/gem_tasks'
require 'rake/testtask'
require 'cane/rake_task'
require 'tailor/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Run RuboCop on the lib directory'
Rubocop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb']
  # only show the files with failures
  task.formatters = ['files']
  # don't abort rake on failure
  task.fail_on_error = false
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--format doc', '--color']
end

desc 'Run all test suites'
task :test => :spec

desc 'Run cane to check quality metrics'
Cane::RakeTask.new do |cane|
  cane.add_threshold 'coverage/.last_run.json', :>=, 99
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

task :default => [:test, :cane, :tailor, :stats, :rubocop]
