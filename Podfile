platform :ios, '11.0'
use_modular_headers!

def code_dependencies
  pod 'RxSwift'
  pod 'RxCocoa'
end

target 'code-challenge' do
  use_frameworks!

  code_dependencies

  pod 'SnapKit'
  pod 'SwiftLint'

end

target 'code-challengeTests' do
  inherit! :search_paths

  code_dependencies

  pod 'RxTest'

end

# post_install do |installer|
#    installer.pods_project.targets.each do |target|
#       if target.name == 'SnapKit'
#          target.build_configurations.each do |config|
#             config.build_settings['SWIFT_VERSION'] = '4.1'
#          end
#       end
#    end
# end