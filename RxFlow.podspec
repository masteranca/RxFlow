Pod::Spec.new do |spec|
  spec.name = "RxFlow"
  spec.version = "1.0.0"
  spec.summary = "Very simple, reactive, fluent HTTP framework"
  spec.homepage = "https://github.com/masteranca/RxFlow"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Anders Carlsson" => 'anders.carlsson@coredev.se' }
  spec.social_media_url = "http://twitter.com/coredev"

  spec.platform = :ios, "9.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/masteranca/RxFlow.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "RxFlow/**/*.{h,swift}"

  spec.dependency "SwiftyJSON", "~> 2.3.2"
  spec.dependency "RxSwift", "~> 2.0"
  spec.dependency "RxCocoa", "~> 2.0"
end
