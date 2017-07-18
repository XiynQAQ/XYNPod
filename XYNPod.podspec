
Pod::Spec.new do |s|
  s.name         = "XYNPod"
  s.version      = "1.0.0"
  s.summary      = "This is my own some commonly used methods"
  s.description      = <<-DESC
                        here is description This is my own some commonly used methods
                       DESC
  s.homepage     = "https://github.com/XiynQAQ/XYNPod"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "XiYanan" => "Xiyn_QAQ@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/XiynQAQ/XYNPod.git", :tag => "1.0.0" }
  s.source_files  = 'XYNPods/XYNPod/XYNPods/MyTools/*.{h,m}'  

  s.framework  = "UIKit"
end

