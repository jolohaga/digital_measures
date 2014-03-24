$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "digital_measures/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "digital_measures"
  s.version     = DigitalMeasures::VERSION
  s.authors     = ["Jose Hales-Garcia, UCI, OIT"]
  s.email       = ["jose.halesgarcia@uci.edu"]
  s.homepage    = "https://github.com/ucirvine/digital_measures"
  s.summary     = "Interact with a DigitalMeasures repository"
  s.description = "Rails plugin provides multi-mapping abilities for interacting with a DigitalMeasures repository."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency 'virtus'
  s.add_dependency 'roxml'
  s.add_development_dependency 'typhoeus'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'debugger'
  
  s.test_files = Dir["spec/**/*"]
end
