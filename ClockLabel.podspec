Pod::Spec.new do |s|

  s.name         = "ClockLabel"
  s.version      = "1.2"
  s.summary      = "Custom Clock Fonts based Label with Glow Effect"
  s.homepage     = "https://github.com/devcarlos/ClockLabel"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Carlos Alcala" => "carlos.alcala@icloud.com" }
  s.social_media_url   = "http://twitter.com/carlosalcala"
  s.platform     = :ios, "8.0"
  s.source      = { :git => 'https://github.com/devcarlos/ClockLabel.git', :tag => s.version.to_s }
  s.source_files = 'ClockLabel/*.swift'
  s.requires_arc  = true
  s.resource = 'ClockLabel/ClockBundle.bundle'
end
