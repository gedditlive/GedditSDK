Pod::Spec.new do |s|
    s.name             = 'GedditCommerceSDK'
    s.version          = '1.0.15'
    s.summary          = 'GedditCommerceSDK'
    s.description      = <<-DESC
        GedditCommerceSDK by Geddit
                       DESC

    s.homepage         = 'https://github.com/gedditlive/GedditSDK/tree/master/GedditCommerceSDK/1.0.15'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Rathakit' => 'rathakit@geddit.com' }
    s.source           = { :http => 'https://github.com/gedditlive/GedditSDK/raw/master/GedditCommerceSDK/1.0.15/GedditCommerceSDK.zip'}
    s.swift_versions   = '4.0'

    s.ios.deployment_target = '10.0'
    s.ios.vendored_frameworks = 'GedditCommerceSDK.framework'
    
    s.dependency 'GedditCoreSDK'
end
