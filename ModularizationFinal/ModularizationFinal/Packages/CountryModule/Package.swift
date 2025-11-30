// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "CountryModule",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "CountryModule",
            targets: ["CountryModule"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/roberthein/TinyConstraints.git", from: "4.0.0"),
        
        .package(path: "../Network"),
        .package(path: "../UiComponents")
    ],
    targets: [
        .target(
            name: "CountryModule",
            dependencies: [
                .product(name: "TinyConstraints", package: "TinyConstraints"),
                .product(name: "Network", package: "Network"),
                .product(name: "UiComponents", package: "UiComponents")
            ]
        )
    ]
)
