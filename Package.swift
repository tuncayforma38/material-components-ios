// swift-tools-version:5.9
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
        ),
    ],
    targets: [
        .target(
            name: "MaterialComponents",
            path: "components",
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("**")
            ]
        )
    ]
)
