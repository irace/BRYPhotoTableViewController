Pod::Spec.new do |s|
  s.name         = "BRYPhotoTableViewController"
  s.version      = "1.0.0"
  s.summary      = "A poor attempt at mimicking Rdio for iOS's table view controllers with album art"
  s.homepage     = "http://github.com/irace/BRYPhotoTableViewController"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Bryan Irace" => "bryan@irace.me" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/irace/BRYPhotoTableViewController.git", :tag => "1.0.0" }
  s.source_files  = 'Classes'
  s.framework  = 'Foundation', 'UIKit'
  s.requires_arc = true
end
