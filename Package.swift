// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "SwiftAI",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "swiftai", targets: ["SwiftAI"])
    ],
    dependencies: [
        .package(url: "git@github.com:apple/swift-argument-parser.git", from: "1.2.2"),
        .package(url: "git@github.com:apple/swift-docc-plugin.git", from: "1.4.3"),
        .package(url: "git@github.com:janodevorg/OpenAIClient.git", from: "2.0.0"),
        .package(url: "git@github.com:janodevorg/Keychain.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "SwiftAI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Keychain", package: "Keychain"),
                .product(name: "OpenAIClient", package: "OpenAIClient")
            ],
            path: "Sources/Main"
        )
    ]
)
