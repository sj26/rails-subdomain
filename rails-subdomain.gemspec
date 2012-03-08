# -*- encoding: utf-8 -*-
require File.expand_path('../lib/rails/subdomain/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "rails-subdomain"
  gem.author        = "Samuel Cochran"
  gem.email         = "sj26@sj26.com"
  gem.description   = %q{Some convenience methods making subdomains in Rails a whole lot easier.}
  gem.summary       = %q{Rails subdomain helpers.}
  gem.homepage      = "https://github.com/sj26/rails-subdomain"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
  gem.version       = Rails::Subdomain::VERSION

  gem.add_dependency 'rails', '~> 3.2.0'
end
