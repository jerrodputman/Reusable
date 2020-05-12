// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Reusable",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9)
    ],
    products: [
        .library(
            name: "Reusable",
            targets: ["Reusable"]),
    ],
    targets: [
        .target(
            name: "Reusable",
            dependencies: []),
        .testTarget(
            name: "ReusableTests",
            dependencies: ["Reusable"]),
    ]
)
