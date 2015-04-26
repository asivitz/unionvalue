# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://guides.rubygems.org/specification-reference/ for more options
  gem.name = "unionvalue"
  gem.homepage = "http://github.com/asivitz/unionvalue"
  gem.license = "MIT"
  gem.summary = %Q{Immutable union values}
  gem.description = <<HERE
Allows easy creation of immutable union values, a.k.a. sum-types.

Example: 
APICallResult = UnionValue.new(:success, :failure, :timeout)
APICallResult.failure.is_failure? #=> true
APICallResult.timeout.is_success? #=> false
APICallResult.success(12345).data #=> 12345
HERE
  gem.email = "aosivitz@gmail.com"
  gem.authors = ["Axis Sivitz"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "unionvalue #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
