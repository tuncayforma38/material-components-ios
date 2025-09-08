// swift-tools-version:5.3


import PackageDescription

let package = Package(
    name: "MaterialComponents",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "MaterialComponents",
            targets: ["MaterialComponents"]
        )

    ],
    targets: [
        .target(
            name: "MaterialCollections",
            path: "components/Collections",
            publicHeadersPath: "."
        ),
    ]
)
