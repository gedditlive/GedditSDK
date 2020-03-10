# ios-commerce-sdk

## Integration

1. Using Cocoapods edit Podfile:

```
source 'https://github.com/gedditlive/GedditSDK.git'
target 'YourTargetName' do
pod 'GedditCommerceSDK'
end
```


2. Edit Info.plist to add support for downloading images and video streams using HTTP protocol:

```
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
<key>NSAllowsArbitraryLoadsForMedia</key>
<true/>
<key>NSExceptionDomains</key>
<dict>
<key>domain_name_1</key>
<dict>
<key>NSExceptionRequiresForwardSecrecy</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
</dict>
<key>domain_name_2</key>
<dict>
<key>NSExceptionRequiresForwardSecrecy</key>
<true/>
<key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
<true/>
</dict>
</dict>
</dict>

```

3. SDK Initialization

```
import GedditCommerceSDK

class ViewController : UIViewController() {
func openSDK() {
let userSettings = UserSettings(userId: "12345",    // required
name: "TestUser",   // required
email: "test@gmail.com",
mobile: "+66612345678",
profileURL: "https://profile.url",
gender: .male)
let sdk = GedditLiveCommerce(appId: "12359616-26f7-4b21-9e26-2ce766d5c6ed",
appSecret: "ba822b68b152f015730380224c525021",
userSettings: userSettings,
delegate: self)
sdk.present(from: self)
}
}
```

4. Conform to GedditCommerceSDKDelegate protocol

```
extension ViewController: GedditCommerceSDKDelegate {
// Controller that would be presented by SDK together with PIP
func viewControllerForProduct(id: String, dismiss: @escaping ()->()) -> UIViewController {
let vc = ProductViewController(product: id)
vc.onDismiss = { dismiss() }
return vc
}

// Present popup view or modal controller
func presentCustomController(from: UIViewController, product id: String) {
let vc = ProductViewController(product: id)
vc.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closePopupDetails))
let nc = UINavigationController(rootViewController: vc)
nc.modalPresentationStyle = .fullScreen
from.present(nc, animated: true, completion: nil)
presentedDetailsController = nc
}

@objc func closePopupDetails() {
presentedDetailsController?.dismiss(animated: true, completion: nil)
}
}
```

5. Access to shared instance of GedditCommerceSDK:
```
public class GedditLiveCommerce {
weak public static var shared: GedditCommerceSDK.GedditLiveCommerce?
}
```

6. Present and dismiss UIViewController presented with SDK:

```
let vc = ClientViewController()
vc.onDismiss = { 
GedditLiveCommerce.shared?.dismissViewController(completion: {})
}

vc.onTogglePIP = {
GedditLiveCommerce.shared?.togglePIP()
}

GedditLiveCommerce.shared?.presentViewController(UIViewController(), animated: true)
```

7. Toggle PIP while UIViewController presented with SDK:

```
func togglePIP(_ show: Bool? = nil)
```

8. If you encounter issues with missing icons and images on SDK screens, then choose your app target, go to ‘Build Setting’ -> ‘Asset Catalog Compiler - Options’ -> ‘Build Active Resources Only’ and set it to “No”
