Pod::Spec.new do |s|
    s.name             = 'GedditCoreSDK'
    s.version          = '1.0.0'
    s.summary          = 'GedditCoreSDK'
    s.description      = <<-DESC
        GedditCoreSDK by Geddit
                       DESC

    s.homepage         = 'https://github.com/gedditlive/GedditSDK/tree/master/GedditCoreSDK/1.0.0'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andrei Solovev' => 'andrei@7peakssoftware.com' }
    s.source           = { :http => 'https://github.com/gedditlive/GedditSDK/raw/master/GedditCoreSDK/1.0.0/GedditCoreSDK.framework.zip'}
    
    s.ios.deployment_target = '10.0'
    s.dependency 'ObjectMapper'
    s.dependency 'Alamofire'
    s.dependency 'AlamofireImage'
    s.dependency 'Socket.IO-Client-Swift'
end
