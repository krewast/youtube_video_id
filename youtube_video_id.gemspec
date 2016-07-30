# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtube_video_id/version'

Gem::Specification.new do |spec|
  spec.name          = "youtube_video_id"
  spec.version       = YoutubeVideoId::VERSION
  spec.authors       = ["krewast"]
  spec.email         = ["bastiankres@gmail.com"]

  spec.summary       = %q{This gem makes it easy to extract the YouTube video IDs from YouTube video urls.}
  spec.description   = %q{This gem makes it easy to extract the YouTube video IDs from YouTube video urls. These urls come in various forms and it is not exactly trivial to get the video ID out of them. This is where this gem comes to help.}
  spec.homepage      = "https://github.com/krewast/youtube_video_id"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.2"
end
