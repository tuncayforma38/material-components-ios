// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MaterialComponents",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(name: "TextFields", targets: ["TextFields"]),
        .library(name: "Collections", targets: ["Collections"]),
        .library(name: "CollectionCells", targets: ["CollectionCells"])
    ],
    dependencies: [
        .package(url: "https://github.com/volvogroup-mobility/material-text-accessibility-ios", from: "2.0.1+volvo1"),
        .package(url: "https://github.com/volvogroup-mobility/material-internationalization-ios", from: "3.0.0+volvo1")
    ],
    targets: [
        .target(
            name: "AnimationTiming",
            path: "components/AnimationTiming/src",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("../../MinimumOS/src")]
        ),
        .target(
            name: "Buttons",
            dependencies: [
                .product(name: "MDFInternationalization", package: "material-internationalization-ios"),
                .product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"),
                "Elevation", "Ink", "Ripple", "Shadow", "ShadowElevations", "ShadowLayer",
                "ShapeLibrary", "Shapes", "Typography", "PrivateMath"
            ],
            path: "components/Buttons/src",
            exclude: ["ButtonThemer", "ColorThemer", "PerformantShadowMigration", "ShapeThemer", "Theming", "TypographyThemer"],
            cSettings: [.headerSearchPath("include")]
        ),
        .target(name: "Color", path: "components/Color/src", publicHeadersPath: "."),
        .target(
            name: "Elevation",
            dependencies: ["Color", "PrivateColor", "PrivateMath"],
            path: "components/Elevation/src",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("../../Availability/src")]
        ),
        .target(
            name: "Ink",
            dependencies: ["PrivateColor", "PrivateMath"],
            path: "components/Ink/src",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("../../Availability/src"), .headerSearchPath("private")]
        ),
        .target(name: "Palettes", path: "components/Palettes/src", publicHeadersPath: "."),
        .target(
            name: "Ripple",
            dependencies: ["AnimationTiming", "PrivateColor", "PrivateMath"],
            path: "components/Ripple/src",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("../../Availability/src")]
        ),
        .target(
            name: "Shadow",
            path: "components/Shadow/src",
            exclude: ["Animations"],
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("../../Availability/src")]
        ),
        .target(name: "ShadowElevations", path: "components/ShadowElevations/src", publicHeadersPath: "."),
        .target(name: "ShadowLayer", dependencies: ["ShadowElevations"], path: "components/ShadowLayer/src", publicHeadersPath: "."),
        .target(name: "ShapeLibrary", dependencies: ["Shapes", "PrivateMath"], path: "components/ShapeLibrary/src", publicHeadersPath: "."),
        .target(name: "Shapes", dependencies: ["ShadowLayer", "PrivateColor", "PrivateMath"], path: "components/Shapes/src", publicHeadersPath: "."),
        .target(
            name: "TextFields",
            dependencies: [
                "AnimationTiming", "Buttons", "Elevation", "Palettes", "Typography", "PrivateMath",
                .product(name: "MDFInternationalization", package: "material-internationalization-ios")
            ],
            path: "components/TextFields/src",
            exclude: ["Theming", "ColorThemer"],
            cSettings: [.headerSearchPath("../../MinimumOS/src"), .headerSearchPath("include")]
        ),
        .target(
            name: "Typography",
            dependencies: [.product(name: "MDFTextAccessibility", package: "material-text-accessibility-ios"), "PrivateApplication", "PrivateMath"],
            path: "components/Typography/src",
            exclude: ["FontLoader", "FontScaler"],
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("private")]
        ),
        // Private
        .target(name: "PrivateApplication", path: "components/private/Application/src", publicHeadersPath: "."),
        .target(name: "PrivateColor", path: "components/private/Color/src", publicHeadersPath: ".", cSettings: [.headerSearchPath("../../../Availability/src")]),
        .target(name: "PrivateMath", path: "components/private/Math/src", publicHeadersPath: "."),
        
        // Collections
        .target(
            name: "Collections",
            dependencies: ["CollectionCells", "PrivateMath"],
            path: "components/Collections/src",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("include")]
        ),
        .target(
            name: "CollectionCells",
            dependencies: ["PrivateMath", "Ink", "ShapeLibrary"],
            path: "components/CollectionCells/src",
            publicHeadersPath: ".",
            cSettings: [.headerSearchPath("include")]
        ),
    ]
)
