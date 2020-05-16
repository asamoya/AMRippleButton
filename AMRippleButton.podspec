#
# Be sure to run `pod lib lint AMRippleButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMRippleButton'
  s.version          = '0.1.3'
  s.summary          = 'Ripple effect button for iOS written in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple and easy, ripple effect button for iOS.
Written in Swift 5.0.
You can set border line and corner radius to the UIButton instance.
No swift-coding is required, because it's accessible from storyboard or xib.
                       DESC

  s.homepage         = 'https://github.com/asamoya/AMRippleButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kaname ohara' => 'kaname.ohara@gmail.com' }
  s.source           = { :git => 'https://github.com/asamoya/AMRippleButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'
  s.source_files = 'AMRippleButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'AMRippleButton' => ['AMRippleButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
