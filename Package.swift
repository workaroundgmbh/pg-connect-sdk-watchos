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
            url: "https://dl.cloudsmith.io/QQ43WPa2Y7VlFUM3/proglove/markconnectiossdk-prod/raw/names/ConnectSDKWatch-1.3.0.xcframework/versions/1.3.0/ConnectSDKWatch-1.3.0.xcframework.zip?accept_eula=8",
            checksum: "2306422013a011a60d8ef29a5216343db19d07ea7e26aab6312ce952dc355f40"),
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
