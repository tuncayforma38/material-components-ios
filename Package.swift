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
            targets: ["MaterialCollections"]
        )

    ],
    targets: [
        .target(
            name: "MaterialCollections",
            path: "components/Collections",
            exclude: [
                "README.md",
                "docs",
                "examples",
                "scripts"
            ],
            sources: ["**/*.h", "**/*.m", "**/*.swift"],
            publicHeadersPath: "."
        )
    ]
)
