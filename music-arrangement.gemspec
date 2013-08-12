# -*- encoding: utf-8 -*-

require File.expand_path('../lib/music-arrangement/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "music-arrangement"
  gem.version       = Music::Arrangement::VERSION
  gem.summary       = %q{Arrange music scores by assigning instruments to parts and such}
  gem.description   = <<DESCRIPTION
Prepare a musical arrangement from a score, by assigning instruments to parts.
DESCRIPTION
  gem.license       = "MIT"
  gem.authors       = ["James Tunnell"]
  gem.email         = "jamestunnell@lavabit.com"
  gem.homepage      = "https://github.com/jamestunnell/music-arrangement"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'hashmake', '>= 0.2.1'
  
  gem.add_development_dependency 'bundler', '~> 1.0'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.4'
  gem.add_development_dependency 'yard', '~> 0.8'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-nav'
  gem.add_development_dependency 'ore'
end
