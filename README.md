# Geddit SDK

* [Get Started](#get-started)
	* [Installation](#installation)
		* [Cocoapods](#cocoapods)
	* [Initialize Commerce SDK](#initialize-commerce-sdk)
	* [Display Live Stream](#display-live-stream)
	* [Close Live Stream](#close-live-stream)
	* [Picture In Picture](#picture-in-picture)
		* [Expand To Go Back To Live Stream View](#expand-to-go-back-to-live-stream-view)
		* [Toggle PIP View](#toggle-pip-view)
		* [Force To Display PIP View](#force-to-display-pip-view)
		* [Force To Hide PIP View](#force-to-hide-pip-view)
* [Fonts](#fonts)
* [Delegate](#delegate)
	* [Product View Delegate](#product-view-delegate)
	* [Picture In Picture Delegate](#picture-in-picture-delegate)
	* [Voucher Delegate](#voucher-delegate)
* [Video And Image Streams Support](#video-and-image-streams-support)
* [Dependencies](#dependencies)
	* [3rd party](#3rd-party)
* [Requirements](#requirements)

## Get Started

### Installation

#### Cocoapods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa 
projects. For usage and installation instructions, visit their website. 
To integrate Alamofire into your Xcode project using CocoaPods, specify 
it in your Podfile:

```ruby
source 'https://github.com/gedditlive/GedditSDK.git'

target 'YourTargetName' do
  pod 'GedditCommerceSDK'
  pod 'GedditCoreSDK'
end
```

### Initialize Commerce SDK

```swift
import GedditCommerceSDK

class ViewController : UIViewController() {
	func openSDK() {
		let userSettings = UserSettings(
			userId: "12345",
			name: "TestUser",
			email: "test@gmail.com",
			mobile: "+66612345678",
			profileURL: "https://profile.url",
			gender: .male
		)
		let sdk = GedditLiveCommerce(
			appId: "12359616-26f7-4b21-9e26-2ce766d5c6ed",
			appSecret: "ba822b68b152f015730380224c525021",
			userSettings: userSettings
		)
	}
}
```

### Display Live Stream

```swift
sdk.present(from: self)
```

### Close Live Stream

```swift
sdk.dismiss()
```

### Picture In Picture

#### Expand To Go Back To Live Stream View

```swift
sdk.popToLiveStreamController()
```

#### Toggle PIP View

```swift
sdk.togglePIP()
```

#### Force To Display PIP View

```swift
sdk.togglePIP(true)
```

#### Force To Hide PIP View

```swift
sdk.togglePIP(false)
```

## Fonts

In order to display the text using the right fonts, please add the font files in your target and update your `Info.plist` as follows:

```swift
<key>UIAppFonts</key>
<array>
  <string>GraphikTH-SemiBoldItalic.ttf</string>
  <string>GraphikTH-RegularItalic.ttf</string>
  <string>GraphikTH-SemiBold.ttf</string>
  <string>GraphikTH-Regular.ttf</string>
  <string>GraphikTH-Bold.ttf</string>
  <string>GraphikTH-Light.ttf</string>
  <string>GraphikTH-Medium.ttf</string>
  <string>GraphikTH-MediumItalic.ttf</string>
  <string>CircularLLMono-Regular.ttf</string>
  <string>Circular-ThinItalic.ttf</string>
  <string>Circular-Thin.ttf</string>
  <string>Circular-Regular.ttf</string>
  <string>Circular-MediumItalic.ttf</string>
  <string>Circular-Medium.ttf</string>
  <string>Circular-LightItalic.ttf</string>
  <string>Circular-Light.ttf</string>
  <string>Circular-Italic.ttf</string>
  <string>Circular-ExtraBlackItalic.ttf</string>
  <string>Circular-ExtraBlack.ttf</string>
  <string>Circular-BookItalic.ttf</string>
  <string>Circular-Book.ttf</string>
  <string>Circular-BoldItalic.ttf</string>
  <string>Circular-Bold.ttf</string>
  <string>Circular-BlackItalic.ttf</string>
  <string>Circular-Black.ttf</string>
<array>
```

## Delegate

### Product View Delegate

`GedditCommerceSDKDelegate` allows you to create your custom product view controller and
manage its life cycle.

```swift
extension ViewController: GedditCommerceSDKDelegate {
	func viewController(for product: Product, dismiss: @escaping ()->()) -> UIViewController {
		// Return your custom product view controller.
	}

	func presentViewController(for product: Product, from: UIViewController) {
		// Configure your custom view controller.
	}

	@objc func closePopupDetails() {
		// Called when the popup details is closed.
	}
}
```

You can initialize the product delegate by assigning your implementation to the `pipDelegate`
property.

```swift
sdk.delegate = self
```

Or initialize the SDK with your product delegate implementation.

```swift
let sdk = GedditLiveCommerce(
	appId: "12359616-26f7-4b21-9e26-2ce766d5c6ed",
	appSecret: "ba822b68b152f015730380224c525021",
	userSettings: userSettings,
	delegate: self
)
```

### Picture In Picture Delegate

`GedditCommerceSDKPIPDelegate` allows you to control when picture in picture view is
closed or tapped.

```swift
extension ViewController: GedditCommerceSDKPIPDelegate {
	func pipCloseTapped() {
		// Called when the user try to close the PIP view.
	}
	
	func pipTapped() {
		// Called when the user tap on the PIP view.
	}
}
```

You can initialize the PIP delegate by assigning your implementation to the `pipDelegate`
property.

```swift
sdk.pipDelegate = self
```

Or initialize the SDK with your PIP delegate implementation.

```swift
let sdk = GedditLiveCommerce(
	appId: "12359616-26f7-4b21-9e26-2ce766d5c6ed",
	appSecret: "ba822b68b152f015730380224c525021",
	userSettings: userSettings,
	pipDelegate: self
)
```

By default clicking on PIP brings you to the live stream and closing the PIP causes closing 
SDK. If you want to change this behaviour, please conform to 
`GedditCommerceSDKPIPDelegate`.

### Voucher Delegate

`GedditCommerceVoucherDelegate` allows you to get called back when user won a voucher.

```swift
extension ViewController: GedditCommerceVoucherDelegate {
	func didWinVoucher(_ voucher: Voucher) {
		// Called when user won a voucher.
	}
}
```

You can initialize the voucher delegate by assigning your implementation to the
`voucherDelegate` property.

```swift
sdk.voucherDelegate = self
```

Or initialize the SDK with your voucher delegate implementation.

```swift
let sdk = GedditLiveCommerce(
	appId: "12359616-26f7-4b21-9e26-2ce766d5c6ed",
	appSecret: "ba822b68b152f015730380224c525021",
	userSettings: userSettings,
	voucherDelegate: self
)
```

## Video And Image Streams Support

Edit `Info.plist` to add support for downloading images and video streams using HTTP 
protocol:

```xml
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

## Dependencies

We make heavy use of the following projects, and so it can be helpful to be 
familiar with them:

### 3rd Party

* [Alamofire](https://github.com/Alamofire/Alamofire): Alamofire is an HTTP 
networking library written in Swift.
* [AlamofireImage](https://github.com/Alamofire/AlamofireImage): AlamofireImage is an image 
component library for Alamofire.
* [SDWebImage](https://github.com/SDWebImage/SDWebImage): his library provides an async 
image downloader with cache support. For convenience, we added categories for UI elements 
like `UIImageView`, `UIButton`, `MKAnnotationView`.
* [DeviceKit](https://github.com/devicekit/DeviceKit): DeviceKit is a value-type replacement of 
`UIDevice`.
* [ObjectMapper](https://github.com/tristanhimmelman/ObjectMapper): ObjectMapper is a 
framework written in Swift that makes it easy for you to convert your model objects 
(classes and structs) to and from JSON.
* [SocketIO](https://github.com/socketio/socket.io-client-swift): Socket.IO-client for iOS/OS X.

## Requirements

* iOS 10.0+
* Xcode 12+
* Swift 5.0+.
