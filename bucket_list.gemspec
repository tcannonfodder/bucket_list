$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bucket_list/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bucket_list"
  s.version     = BucketList::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of BucketList."
  s.description = "TODO: Description of BucketList."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
