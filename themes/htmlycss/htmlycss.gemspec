# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "htmlycss"
  spec.version       = "1.0.0"
  spec.authors       = ["Axel Valdez"]
  spec.email         = ["axel@paskola.com"]

  spec.summary       = "HTMLyCSS theme"
  spec.homepage      = "https://htmlycss.com"
  spec.license       = "Copyright"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
