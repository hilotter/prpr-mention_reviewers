# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prpr/mention_reviewers/version'

Gem::Specification.new do |spec|
  spec.name          = "prpr-mention_reviewers"
  spec.version       = Prpr::MentionReviewers::VERSION
  spec.authors       = ["hilotter"]
  spec.email         = ["hilotter3@gmail.com"]

  spec.summary       = "Prpr plugin for notifying chat to Pull Request reviewers."
  spec.description   = "When you assign Pull request reviewers, it post to chat service too."
  spec.homepage      = "https://github.com/hilotter/prpr-reviewer_mention"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "prpr"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
