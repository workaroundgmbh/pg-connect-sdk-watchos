# ProGlove ConnectSDKWatch

The **ProGlove ConnectSDKWatch** is a Swift SDK used to communicate with the ProGlove scanners.

## Licence

** **BY USING THIS SDK YOU AGREE TO THE FOLLOWING [LICENSE TERMS](/LICENSE) AS DEFINED BY PROGLOVE.** **

## Requirements

The ConnectSDK for Swift supports the following:
- Swift 5.7 or higher
- watchOS 9 or higher

Environment for iOS is supported by this library: [ConnectSDK](https://github.com/workaroundgmbh/pg-connect-sdk-ios)

## Dependencies

Dependencies that are being used are necessary for the SDK to work properly.

Current dependencies that are being used in the package are:
- SwiftProtobuf
- nRF Connect Device Manager
- QRCode

## Integrating Into an Existing Xcode Project or Package

Here are the steps to get the Connect SDK installed into either your existing Xcode Project or Package.
### Installing the Connect SDK into your Xcode Project

1. Open your project in the Xcode IDE.  From the drop down menu, select File > Add Packages...

2. In the field labeled "Search or Enter Package URL", enter "https://github.com/workaroundgmbh/pg-connect-sdk-watchos".  Set the
dependency rule and project as needed, then click "Add Package". The package will download and install to your Xcode
project.

3. In the "Choose Package Products for ConnectSDK" popup window, check the box, and set the Xcode target.  Click "Add Package".

### Installing the Connect SDK into your Swift Package

In your package's `Package.swift`, add Connect SDK as a package dependency:
```swift
// swift-tools-version:5.7
import PackageDescription
let package = Package(
    name: "<Your Product Name>",
    dependencies: [
		  .package(url: "https://github.com/workaroundgmbh/pg-connect-sdk-watchos", .upToNextMajor(from: "1.0.0"))
    ],
)
```
## API Reference documentation

Please use the [ProGlove Documentation](https://docs.proglove.com/en/insight-mobile--ios-.html) that is already provided.

For now, DocC is not in the current scope, but hopefully in the near future it will be included.
