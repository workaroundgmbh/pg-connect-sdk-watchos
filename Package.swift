// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "ConnectSDK",
    platforms: [
        .watchOS(.v9)
    ],
    products: [
        .library(
            name: "ConnectSDKWatch",
            targets: ["ConnectSDKWatch", "ConnectSDKWatchDependencies"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.26.0"),
        .package(url: "https://github.com/NordicSemiconductor/IOS-nRF-Connect-Device-Manager", .upToNextMinor(from: "1.6.0")),
        .package(url: "https://github.com/dagronf/QRCode", from: "19.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "ConnectSDKWatch",
            url: "https://dl.cloudsmith.io/QQ43WPa2Y7VlFUM3/proglove/markconnectiossdk-prod/raw/names/ConnectSDKWatch-1.2.0.xcframework/versions/1.2.0/ConnectSDKWatch-1.2.0.xcframework.zip?accept_eula=8",
            checksum: "540b3b4b33f5b85cf3a1fd10cceffd6e1cbb70bf7c9a15dba288561ce56424cf"),
        .target(
            name: "ConnectSDKWatchDependencies",
            dependencies: [
                "QRCode",
                .target(name: "ConnectSDKWatch"),
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "iOSMcuManagerLibrary", package: "IOS-nRF-Connect-Device-Manager")
            ],
            path: "Sources/ConnectSDKWatch"
        )
    ]
)
