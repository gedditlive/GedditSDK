Pod::Spec.new do |s|
    s.name             = 'GedditCoreSDK'
    s.version          = '1.0.14'
    s.summary          = 'GedditCoreSDK'
    s.description      = <<-DESC
        GedditCoreSDK by Geddit
                       DESC

    s.homepage         = 'https://github.com/gedditlive/GedditSDK/tree/master/GedditCoreSDK/1.0.14'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Rathakit' => 'rathakit@geddit.com' }
    s.source           = { :http => 'https://github.com/gedditlive/GedditSDK/raw/master/GedditCoreSDK/1.0.14/GedditCoreSDK.zip'}
    
    s.ios.deployment_target = '10.0'
    s.ios.vendored_frameworks = 'GedditCoreSDK.framework'
    s.swift_versions   = '4.0'
    
    s.dependency 'ObjectMapper'
    s.dependency 'Alamofire', '~> 4.9.0'
    s.dependency 'AlamofireImage'
    s.dependency 'Socket.IO-Client-Swift'
end