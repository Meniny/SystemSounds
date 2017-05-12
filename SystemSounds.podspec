
Pod::Spec.new do |s|
  s.name             = "SystemSounds"
  s.version          = "1.0.0"
  s.summary          = "An iOS System Sounds Player Framework."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        SystemSounds is an iOS System Sounds Player Framework.
                        DESC

  s.homepage         = "https://github.com/Meniny/SystemSounds"
  s.license          = 'MIT'
  s.author           = { "Meniny" => "Meniny@qq.com" }
  s.source           = { :git => "https://github.com/Meniny/SystemSounds.git", :tag => s.version.to_s }
  s.social_media_url = 'http://meniny.cn/'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }

  s.source_files = 'SystemSounds/**/*{.swift}', 'SystemSounds/**/*{.h}'
  s.public_header_files = 'SystemSounds/**/*{.h}'
  s.ios.frameworks = 'Foundation', 'AudioToolbox', 'UIKit'
  s.osx.frameworks = 'Foundation', 'AudioToolbox'
end
