// swift-tools-version: 6.0
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
        .testTarget(name: "XnLevenshteinUnit", dependencies: ["XnLevenshtein"]),
        .testTarget(name: "XnLevenshteinPerformance", dependencies: ["XnLevenshtein"])
    ]
)
