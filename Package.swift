
// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MaterialComponents",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "MaterialComponents",
            targets: ["MaterialComponents"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MaterialComponents",
            dependencies: [],
            path:"Components"
        )
    ]
)
