Gem::Specification.new do |s|
  s.name         = "dstfvrts_fundraiser"
  s.version      = "1.0"
  s.author       = "dstfvrt"
  s.email        = "dstfvrt@gmail.com"
  s.homepage     = "https://github.com/dstfvrt/pragmatic-studio-fundraising"
  s.summary      = "CLI text fundraiser"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'crowdfund' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
