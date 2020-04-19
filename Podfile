
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
def google_utilites
  pod 'GoogleUtilities/AppDelegateSwizzler'
  pod 'GoogleUtilities/Environment'
  pod 'GoogleUtilities/ISASwizzler'
  pod 'GoogleUtilities/Logger'
  pod 'GoogleUtilities/MethodSwizzler'
  pod 'GoogleUtilities/NSData+zlib'
  pod 'GoogleUtilities/Network'
  pod 'GoogleUtilities/Reachability'
  pod 'GoogleUtilities/UserDefaults'
end

target 'DoSomething' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'HGCircularSlider'
  pod 'Hero'
  pod 'Stellar', :git => 'https://github.com/AugustRush/Stellar.git'
  pod 'BEKListKit'
  pod 'SDWebImage'
  pod "SwiftRater"
  pod 'Siren'
  pod 'IQKeyboardManagerSwift'
  pod 'Google-Mobile-Ads-SDK'
  pod 'SwiftLocalNotification'
  google_utilites
  
  # Pods for DoSomething
  target 'AnalyticPlatform' do
    pod 'Firebase'
    pod 'Firebase/Analytics'
    pod 'Firebase/Crashlytics'
    pod 'FCUUID'
    google_utilites
  end

  target 'Domain' do
    pod 'SwiftLocalNotification'
  end
end


