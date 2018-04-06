#
# Be sure to run `pod lib lint Banner.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Banner'
  s.version          = '1.0.0'
  s.summary          = 'Banner creates small, non-intrusive alerts in the corners of a UIViewController.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
When you want to display a message to a user but don't want to display a popup that the user has to dismiss, Banner comes in handy by creating a small, non-intrusive alert view in the corners of a UIViewController. Now, instead of taking up the entire screen with a dialog, just use Banner to display a UIView in either the top left, top right, bottom left, or bottom right corner of an iOS screen.
                       DESC

  s.homepage         = 'https://github.com/authman2/Banner'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'authman2' => 'authman2@gmail.com' }
  s.source           = { :git => 'https://github.com/authman2/Banner.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Banner/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Banner' => ['Banner/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
