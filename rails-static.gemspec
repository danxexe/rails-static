# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rails-static"
  s.version     = '1.0.0'
  s.authors     = ["DanX"]
  s.email       = ["danx.exe@gmail.com"]
  s.homepage    = "http://danx.in"
  s.summary     = "Generate a static site with Rails."
  s.description = "A rake task for generating static websites using Rails."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end