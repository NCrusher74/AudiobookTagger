// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AudiobookTagger",
    products: [
        .library(
            name: "AudiobookTagger",
            targets: ["AudiobookTagger"]),
    ],
    dependencies: [
        .package(
            name: "SwiftTagger",
            url: "https://github.com/NCrusher74/SwiftTagger",
            from: "0.3.0"),
    ],
    targets: [
        .target(
            name: "AudiobookTagger",
            dependencies: [
                .product(name: "SwiftTagger", package: "SwiftTagger")],
            path: "Sources"),
        .testTarget(
            name: "AudiobookTaggerTests",
            dependencies: ["AudiobookTagger"]),
    ]
)
