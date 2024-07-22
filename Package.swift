// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MarioKart",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "MarioKart",
            targets: ["MarioKart"]),
    ],
    targets: [
        .target(
            name: "MarioKart"),
        .testTarget(
            name: "MarioKartTests",
            dependencies: ["MarioKart"]
        ),
    ]
)
