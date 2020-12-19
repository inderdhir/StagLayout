// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StagLayout",
    platforms: [.iOS(.v11)],
    products: [
        .library(
            name: "StagLayout",
            targets: ["StagLayout"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "StagLayout",
            dependencies: []),
        .testTarget(
            name: "StagLayoutTests",
            dependencies: ["StagLayout"]),
    ]
)
