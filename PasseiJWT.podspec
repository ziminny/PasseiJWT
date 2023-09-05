Pod::Spec.new do |s|
  s.name                  = 'PasseiJWT'
  s.version               = '0.0.2'
  s.summary               = 'JWT Payload'
  s.swift_version         = '5.0'
  s.description           = <<-DESC "Describe the use of pod file"
  This framework encrypt and decrypt jwt
  DESC
  s.homepage              = 'https://github.com/ziminny/PasseiJWT'
  s.license               = { :type => 'PASSEI-GROUP', :file => 'LICENSE' }
  s.authors               = { 'Vagner Oliveira' => 'ziminny@gmail.com' }
  s.source                = { :git => 'https://github.com/ziminny/PasseiJWT.git', :tag => s.version.to_s }
  s.ios.deployment_target = '14.0'
  s.source_files          = 'PasseiJWT/Classes/**/*' 
  s.dependency 'PasseiLogManager','~>0.0.2' 
end