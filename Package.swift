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
            name: "MaterialComponents",
            path: "components",
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
