# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch('spec/support/**/*.rb')  { "spec" }
  watch('spec/support/**/*.yml')  { "spec" }

  notification :growl
end


guard 'rake', :task => :tailor do
  watch(%r{^lib/(.+)\.rb$})
end
