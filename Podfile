# Uncomment the next line to define a global platform for your project
platform :ios, '14.3'

workspace 'Moviedb.xcworkspace'
project 'Moviedb.xcodeproj'

def md_modules
  pod 'MDCore', :path => 'Modules/MDCore'
end

def app_pods
  md_modules
  
  pod 'Alamofire', '5.4.1'
  pod 'SnapKit', '~> 5.0.0'
  pod 'Kingfisher', '6.3.0'
  pod 'SwiftLint', '~> 0.39.2'
 end
  
target 'Moviedb' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for Moviedb
  app_pods

  target 'MoviedbTests' do
    inherit! :search_paths
    app_pods
  end

  target 'MoviedbUITests' do
    # Pods for testing
  end

end
