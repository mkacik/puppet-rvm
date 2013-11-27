require 'rake'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*/*_spec.rb'
end

task :test do
  puts 'Compiling catalog for node default'
  system('puppet master --compile default --modulepath ./.. --manifest tests/init.pp 1>/dev/null')
end
