Pod::Spec.new do |s|
    s.name             = 'GedditCommerceSDK'
    s.version          = '1.4.0'
    s.summary          = 'GedditCommerceSDK'
    s.description      = <<-DESC
        GedditCommerceSDK by Geddit
                       DESC

    s.homepage         = 'https://github.com/gedditlive/GedditSDK/tree/master/GedditCommerceSDK/1.4.0'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Romain ASNAR' => 'romain@geddit.com' }
    s.source           = { :http => 'https://github.com/gedditlive/GedditSDK/raw/master/GedditCommerceSDK/1.4.0/GedditCommerceSDK.zip'}
    s.swift_versions   = '4.0'

    s.ios.deployment_target = '11.0'
    s.ios.vendored_frameworks = 'GedditCommerceSDK.framework'
    
    s.dependency 'GedditCoreSDK'
    s.dependency 'DeviceKit'
    s.dependency 'SDWebImage'
end
