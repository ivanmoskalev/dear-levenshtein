// swift-tools-version: 5.10.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XnLevenshtein",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15)
    ],
    products: [
        .library(name: "XnLevenshtein", targets: ["XnLevenshtein"]),
    ],
    targets: [
        .target(name: "XnLevenshtein"),
        .testTarget(name: "XnLevenshteinTests", dependencies: ["XnLevenshtein"]),
        .testTarget(name: "XnLevenshteinPerformance", dependencies: ["XnLevenshtein"])
    ]
)
