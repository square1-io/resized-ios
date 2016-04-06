Pod::Spec.new do |s|
  s.name             = "Resized"
  s.version          = "0.1.0"
  s.summary          = "iOS client for resized.co - the on-demand image resizing service"
  s.description      = <<-DESC
  This is a tool used in our iOS projects to use the resized.co service to resize images and
  get resized image URL.
                       DESC

  s.homepage         = "https://github.com/square1-io/resized-ios"
  s.license          = 'MIT'
  s.author           = { "Roberto Pastor" => "rober@square1.io" }
  s.source           = { :git => "https://github.com/square1-io/resized-ios.git", :tag => s.version.to_s }
  
  s.ios.deployment_target = "7.0"
  s.platform     = :ios, '7.0'
  s.requires_arc = true

s.source_files = 'Sources/**/*.{h,m}'

end
