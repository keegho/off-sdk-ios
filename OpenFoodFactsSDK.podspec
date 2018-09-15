Pod::Spec.new do |spec|
spec.name = "OpenFoodFactsSDK"
spec.version = "1.0.0"
spec.summary = "An easy to use framework for building iOS apps for the open food facts database."
spec.homepage = "https://github.com/keegho/off-sdk-ios"
spec.license = { type: 'MIT', file: 'LICENSE' }
spec.authors = { "Kegham Karsian" => 'kegham1983@gmail.com' }
spec.social_media_url = "http://twitter.com/keegho"

spec.platform = :ios, "11.0"
spec.requires_arc = true
spec.source = { git: "https://github.com/keegho/off-sdk-ios.git", tag: "v#{spec.version}", submodules: true }
spec.source_files = "OFF/**/*.{h,swift}"

end
