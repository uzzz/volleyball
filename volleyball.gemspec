# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{volleyball}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Coyne"]
  s.date = %q{2011-02-11}
  s.email = %q{jcoyne@justincoyne.com}
  s.extra_rdoc_files = [
    "README.txt"
  ]
  s.files = [
    "History.txt",
    "Manifest.txt",
    "README.txt",
    "Rakefile",
    "VERSION",
    "lib/volleyball.rb",
    "lib/volleyball/railtie.rb",
    "lib/volleyball/volleyball.rb",
    "test/test_volleyball.rb",
    "volleyball.gemspec"
  ]
  s.homepage = %q{https://github.com/uzzz/volleyball}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Voting mechanism to AR models}
  s.test_files = [
    "test/test_volleyball.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<statistics2>, [">= 0"])
    else
      s.add_dependency(%q<statistics2>, [">= 0"])
    end
  else
    s.add_dependency(%q<statistics2>, [">= 0"])
  end
end

