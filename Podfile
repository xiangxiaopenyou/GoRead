platform :ios, '9.0'

inhibit_all_warnings!

target 'GoRead' do

  use_frameworks!
  
  # Router
  pod 'URLNavigator'
  
  # Rx
  pod 'Moya/RxSwift'
  pod 'Moya-ObjectMapper/RxSwift'
  pod 'RxCocoa'
  
  # Auto layout
  pod 'SnapKit'
  
  # Keyboard
  pod 'IQKeyboardManagerSwift'
  
  # Toast
  pod 'Toast-Swift'
  
  # Image
  pod 'Kingfisher'
  
  # 消除版本警告
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        if config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'].to_f < 9.0
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
        end
      end
    end
  end

end
