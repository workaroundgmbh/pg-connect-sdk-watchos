// swift-tools-version: 5.7
import PackageDescription

let version = "1.5.0"
let checksum = "1ece71e9471c14a6cbc060b113d12236d565e7b12df9f43da85015299e51458c"

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
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.33.0"),
        .package(url: "https://github.com/NordicSemiconductor/IOS-nRF-Connect-Device-Manager", .upToNextMinor(from: "1.6.0")),
        .package(url: "https://github.com/dagronf/QRCode", from: "19.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "ConnectSDKWatch",
            url: "https://dl.cloudsmith.io/QQ43WPa2Y7VlFUM3/proglove/markconnectiossdk-prod/raw/names/ConnectSDKWatch-\(version).xcframework/versions/\(version)/ConnectSDKWatch-\(version).xcframework.zip?accept_eula=8",
            checksum: checksum),
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
