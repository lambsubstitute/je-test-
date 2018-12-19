require 'cucumber/rake/task'
require './features/support/cucumber_settings'
  
desc "Runs Cucumber scenarios with @search tags"
Cucumber::Rake::Task.new :search do |t| 
  t.cucumber_opts = "--tags @search --format pretty"
end

