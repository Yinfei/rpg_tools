Gem::Specification.new do |s|
  s.name        = %q{rpg_tools}
  s.version     = '1.0.0'
  s.author      = 'Yohan Piron'
  s.email       = 'yinfei84@gmail.com'
  s.date        = '2015-08-03'
  s.summary     = 'rpg_tools is a toolbox for tabletop games and RPGs'
  s.description = 'rpg_tools gives you tools for your RPGs : dices, coins, cards...'
  s.homepage    = 'https://github.com/Yinfei/rpg_tools.git'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.test_files    = s.files.grep(%r{^(spec)/})
  s.require_paths = ['lib']
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'rspec', '~> 3.0'
end
