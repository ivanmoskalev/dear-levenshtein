// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DearLevenshtein",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v15)
    ],
    products: [
        .library(name: "DearLevenshtein", targets: ["DearLevenshtein"]),
    ],
    targets: [
        .target(name: "DearLevenshtein"),
        .testTarget(name: "DearLevenshteinUnit", dependencies: ["DearLevenshtein"]),
        .testTarget(name: "DearLevenshteinPerformance", dependencies: ["DearLevenshtein"])
    ]
)
