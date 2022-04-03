platform :ios, '14.1'

target 'TechTest' do
  use_frameworks!

  # Pods for TechTest

  pod 'Alamofire', '~> 5.5.0'
  pod 'SDWebImage', '~> 5.0.0'
  pod 'SwiftyMocky', '~> 4.1.0'

  target 'TechTestTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TechTestUITests' do
    # Pods for testing
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
