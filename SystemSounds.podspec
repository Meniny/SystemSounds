
Pod::Spec.new do |s|
  s.name             = "SystemSounds"
  s.version          = "1.0.1"
  s.summary          = "An iOS System Sounds Player Framework."

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
