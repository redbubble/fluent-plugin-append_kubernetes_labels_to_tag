# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "fluent-plugin-append-kubernetes-labels-to-tag"
  gem.version       = "0.0.3-pre"
  gem.authors       = ["Redbubble Delivery Engineering Team"]
  gem.email         = ["delivery-engineers@redbubble.com"]
  gem.description   = %q{Filter plugin to append certain Kubernetes labels to the Fluentd tag}
  gem.summary       = %q{Filter plugin to append certain Kubernetes labels to the Fluentd tag}
  gem.homepage      = "https://github.com/redbubble/fluent-plugin-append_kubernetes_labels_to_tag"
  gem.license       = "MIT"

  gem.files = Dir['lib/**/*'] + %w(Gemfile README.md fluent-plugin-append-kubernetes-labels-to-tag.gemspec)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.has_rdoc      = false

  gem.required_ruby_version = '>= 2.0.0'

  gem.add_runtime_dependency "fluentd", ">= 0.12.0"

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rspec", "~> 3.0"
end
