require_relative "lib/app/version"

Gem::Specification.new do |spec|
  spec.name        = "app"
  spec.version     = App::VERSION
  spec.authors     = [ "" ]
  spec.email       = [ "" ]
  spec.summary     = "App"
  spec.description = "App"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.1.2"
end
