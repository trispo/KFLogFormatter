Pod::Spec.new do |s|

  s.name         = "KFLogFormatter"
  s.version      = "1.0.0"
  s.summary      = "A log message formatter for CocoaLumberjack."
  s.description  = <<-DESC
                     The KFLogFormatter class provides a log formatter for the CocoaLunmberjack
                     logging framework. It formats messages in the form:
                     
                     LOG_LEVEL  DATE, TIME -[CLASSNAME METHOD][Line LINE_NUMBER] LOG_MESSAGE
                   DESC
  s.homepage     = "http://pods.kf-interactive.com"
  s.license      = 'MIT'
  s.author       = { "Gunnar Herzog" => "gunnar.herzog@kf-interactive.com", "Rico Becker" => "rico.becker@kf-interactive.com" }
  s.source       = { :git => "https://github.com/trispo/KFLogFormatter.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'Classes'
  s.dependency 'CocoaLumberjack', '~> 1.6'
  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.7"
  
end
