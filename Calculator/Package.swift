// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "Calculator",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Calculator",
            targets: ["Calculator"]),
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../UIComponents"),
        .package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "Calculator",
            dependencies: ["DesignSystem", "UIComponents"],
            path: "Sources/Calculator"),
        .testTarget(
            name: "CalculatorTests",
            dependencies: ["Calculator"],
            path: "Tests/CalculatorTests"),
    ]
)
