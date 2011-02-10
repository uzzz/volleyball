# -*- ruby -*-


require 'rake/clean'
require 'rubygems'
require 'hoe'
CLEAN.include %w(**/*.orig)
Hoe.plugins.delete :rubyforge
Hoe.plugin :hg

Hoe.spec 'volleyball' do
  developer('Justin Coyne', 'jcoyne@justincoyne.com')
  extra_deps <<  %w(statistics2 >=0.54) 
  extra_dev_deps << %w(shoulda >=2.10.0) << %w(mocha >=0.9.8) << %w(active_support)
end

task :install =>:package do
  $:<< 'lib'
  require 'volleyball'
  puts `GEM_HOME=~/.gem/ruby/1.8 gem install pkg/volleyball-#{Volleyball::VERSION}.gem`
end
# vim: syntax=ruby
#
