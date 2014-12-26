
Pod::Spec.new do |s|

  s.name          = "AugCommonUtils"
  s.version       = "0.0.1"
  s.summary       = "AugCommonUtils contains many useful categories and daily utils."
  s.homepage      = "https://github.com/AugMeganZhou/AugCommonUtils"
  s.license       = "MIT"

  s.author        = { "Megan" => "meganzhou2013@gmail.com" }
  s.platform      = :ios, "7.0"
  s.source        = { :git => "https://github.com/AugMeganZhou/AugCommonUtils.git", :tag => "0.0.1" }
  s.source_files  =  "AugCommonUtils/**/*.{h,m}"

end
