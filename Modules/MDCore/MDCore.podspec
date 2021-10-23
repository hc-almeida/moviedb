#
# Be sure to run `pod lib lint MDCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MDCore'
  s.version          = '0.2.0'
  s.summary          = 'A short description of MDCore.'
  
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/hc-almeida/MDCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hc-almeida' => 'azev.hellen@gmail.com' }
  s.source           = { :git => 'https://github.com/hc-almeida/MDCore.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.3'
  s.swift_version = "5.0"

  s.source_files = 'MDCore/Source/**/*'
  
  s.static_framework = true
  
  s.frameworks = 'UIKit'
  s.dependency 'Alamofire', '5.4.1'
end
