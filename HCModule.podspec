
Pod::Spec.new do |s|
  s.name             = 'HCModule'
  s.version          = '0.1.0'
  s.summary          = '协议跳转'

  s.description      = <<-DESC
协议跳转
                       DESC

  s.homepage         = 'https://github.com/HChong3210/HCModule'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'HChong3210' => 'hchong7557@gmail.com' }
  s.source           = { :git => 'https://github.com/HChong3210/HCModule.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  s.source_files = 'HCModule/Classes/**/*.{h,m}'
  s.public_header_files = 'HCModule/Classes/**/*.h'
end
