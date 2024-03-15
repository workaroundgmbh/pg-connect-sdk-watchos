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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.16.0"),
        .package(url: "https://github.com/NordicSemiconductor/IOS-nRF-Connect-Device-Manager", from: "1.6.0"),
        .package(url: "https://github.com/dagronf/QRCode", from: "17.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "ConnectSDKWatch",
            url: "https://dl.cloudsmith.io/QQ43WPa2Y7VlFUM3/proglove/markconnectiossdk-prod/raw/names/ConnectSDKWatch-1.0.0.xcframework/versions/1.0.0/ConnectSDKWatch-1.0.0.xcframework.zip?accept_eula=5",
            checksum: "f502698f572ba559301d7b1c217f66394ad86e93aaba29dc6e88b00261b3ccd8"),
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
