# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/bitpagos/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-bitpagos'
  s.version  = OmniAuth::Bitpagos::VERSION
  s.authors  = ['Ernesto Tagwerker']
  s.email    = ['ernesto@ombushop.com']
  s.summary  = 'Bitpagos strategy for OmniAuth'
  s.homepage = 'https://github.com/etagwerker/omniauth-bitpagos'
  s.license  = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth', '~> 1.2.1'
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.2'

  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'sinatra'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec', '~> 2.14.1'
  s.add_development_dependency 'simplecov'
end
