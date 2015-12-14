lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'heroku-scaler/version'

Gem::Specification.new do |s|
  s.name        = 'heroku-scaler'
  s.version     = HerokuScaler::VERSION
  s.summary     = "Heroku Scaler"
  s.description = "A simple script to allow cron-based scaling of a Heroku app"
  s.authors     = ["stirlingolson"]
  s.email       = 'seo@foraker.com'
  s.homepage    = 'https://github.com/foraker/heroku-scaler'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.require_paths = ['lib']

  s.add_dependency 'platform-api', '~> 0'
  s.add_dependency 'rails', '>= 3.0'

  s.add_development_dependency "rspec", '~> 3'
end
