// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "DesignSystem",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "DesignSystem",
            targets: ["DesignSystem"]),
    ],
    targets: [
        .target(
            name: "DesignSystem",
            dependencies: []),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]),
    ]
)
