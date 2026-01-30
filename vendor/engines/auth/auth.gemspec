require_relative "lib/auth/version"

Gem::Specification.new do |spec|
  spec.name        = "auth"
  spec.version     = Auth::VERSION
  spec.authors     = [ "" ]
  spec.email       = [ "" ]
  spec.summary     = "Auth"
  spec.description = "Auth"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.2"
end
