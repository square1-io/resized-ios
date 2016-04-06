Pod::Spec.new do |s|
  s.name             = 'Resized'
  s.version          = '0.1.0'
  s.license          = 'MIT'
  s.summary          = 'iOS client for resized.co - the on-demand image resizing service'
  s.description      = <<-DESC
  This is the iOS client for resized.co, a realtime image resize manipulation service.
                       DESC
  s.homepage         = 'https://github.com/square1-io/resized-ios'
  s.author           = { 'Roberto Pastor' => 'rober@square1.io' }
  s.source           = { :git => "https://github.com/square1-io/resized-ios.git", :tag => 's.version.to_s' }
  s.platform     = :ios, '7.0'
  s.requires_arc = true

s.source_files = 'Sources/**/*.{h,m}'

end
