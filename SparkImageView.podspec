Pod::Spec.new do |s|

  s.name         = "SparkImageView"
  s.version      = "2.1.4"
  s.summary      = "SparkImageView is an iOS cute animated like ImageView written in Swift."
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/alexsteinerde/Spark-ImageView'
  s.ios.deployment_target = '8.0'
  s.author       = { 'Alex Steiner' => 'info@alexsteiner.de' }
  s.source       = { :git => 'https://github.com/alexsteinerde/Spark-ImageView.git', :tag => s.version.to_s }
  s.source_files  = 'Source/**/*.swift'
  s.requires_arc = true
  end

