# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'Beauty' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Beauty

  pod 'SDWebImage', '~> 5.0'
  # pod 'SDWebImage/WebP'
  pod 'SDWebImageWebPCoder'
  pod 'YYCategories'
  pod 'LookinServer'
  pod 'AFNetworking', '~> 4.0'
  pod 'WechatOpenSDK-XCFramework'
  pod 'libextobjc'
  pod 'JSONModel'
  pod 'PromiseKit'
  pod 'MMKV'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "13.0"
    end
  end
end
