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
        .package(url: "https://github.com/NordicSemiconductor/IOS-nRF-Connect-Device-Manager", from: "1.6.0"),
        .package(url: "https://github.com/dagronf/QRCode", from: "19.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "ConnectSDKWatch",
            url: "https://dl.cloudsmith.io/QQ43WPa2Y7VlFUM3/proglove/markconnectiossdk-prod/raw/names/ConnectSDKWatch-1.1.0.xcframework/versions/1.1.0/ConnectSDKWatch-1.1.0.xcframework.zip?accept_eula=7",
            checksum: "f33ce56738abd181e92a0b24fafe8171aac3d914a38f37ece72d69b6e616648c"),
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
