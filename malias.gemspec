# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'malias/version'

Gem::Specification.new do |gem|
  gem.name          = "malias"
  gem.version       = Malias::VERSION
  gem.authors       = ["meager"]
  gem.email         = ["priorytet26@wp.pl"]
  gem.description   = %q{Simply create Ubuntu alias}
  gem.summary       = %q{Create alias in your ubuntu alias file}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
