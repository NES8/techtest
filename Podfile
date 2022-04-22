platform :ios, '14.1'
use_frameworks!
inhibit_all_warnings!

workspace 'TechTest.xcworkspace'

target 'TechTest' do

  pod 'Alamofire', '~> 5.5.0'
  pod 'SDWebImage', '~> 5.0.0'
  pod 'SwiftGen', '~> 6.0'

  target 'TechTestTests' do
    inherit! :search_paths
    pod 'SwiftyMocky', '~> 4.1.0'
    pod 'Nimble', '~> 9.2.0'

  end

  target 'TechTestUITests' do
    pod 'Shock', '~> 6.1.0'
  end

end

target 'Core' do
  project 'Core/Core'

  pod 'Alamofire', '~> 5.5.0'

  target 'CoreTests' do
    inherit! :complete
    pod 'SwiftyMocky', '~> 4.1.0'
  end

end

post_install do |installer|
  installer.generated_projects.each do |project|
    project.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.1'
    end
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.1'
      end
    end
  end
end
