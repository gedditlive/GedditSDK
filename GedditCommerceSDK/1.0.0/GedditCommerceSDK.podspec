Pod::Spec.new do |s|
    s.name             = 'GedditCommerceSDK'
    s.version          = '1.0.0'
    s.summary          = 'GedditCommerceSDK'
    s.description      = <<-DESC
        GedditCommerceSDK by Geddit
                       DESC

    s.homepage         = 'https://github.com/gedditlive/ios-core-sdk/tree/master/GedditCommerceSDK/1.0.0'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andrei Solovev' => 'andrei@7peakssoftware.com' }
    s.source           = { :http => 'https://github.com/gedditlive/ios-core-sdk/tree/master/GedditCommerceSDK/1.0.0/GedditCommerceSDK.framework.zip'}

    s.ios.deployment_target = '10.0'
    s.dependency 'GedditCoreSDK'
end
