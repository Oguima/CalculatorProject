// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "UIComponents",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "UIComponents",
            targets: ["UIComponents"]),
    ],
    dependencies: [
        .package(path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "UIComponents",
            dependencies: ["DesignSystem"]),
        .testTarget(
            name: "UIComponentsTests",
            dependencies: ["UIComponents"]),
    ]
)
