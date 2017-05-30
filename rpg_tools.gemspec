Gem::Specification.new do |s|
  s.name        = %q{RpgTools}
  s.version     = '0.4.4'
  s.author      = 'Yohan Piron'
  s.email       = 'yinfei84@gmail.com'
  s.date        = '2015-08-03'
  s.summary     = 'RpgTools is a toolbox for tabletop games and RPGs'
  s.description = 'RpgTools gives you tools for your RPGs : dices, coins, cards...'
  s.homepage    = 'https://github.com/Yinfei/rpg_tools.git'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.test_files    = s.files.grep(%r{^(spec)/})
  s.require_paths = ['lib']
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'rspec', '~> 3.0'
end
