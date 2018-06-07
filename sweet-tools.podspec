Pod::Spec.new do |s|
  s.name             = 'sweet-tools'
  s.version          = '0.1.1'
  s.summary          = 'sweet swift lib'
  s.description      = <<-DESC
Sweet swift library
                      DESC
  s.homepage         = 'https://github.com/swieeft/sweet-tools'
#  s.screenshots      = '[IMAGE URL 1]', '[IMAGE URL 2]'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'GILNAM PARK' => 'knzzang89@naver.com' }
  s.source           = { :git => 'https://github.com/swieeft/sweet-tools.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'sweet-tools/*.swift'
end