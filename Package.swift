// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "8PuzzleSolver",
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.65.1")
    ],
    targets: [
        .executableTarget(
            name: "8PuzzleSolver"
        )
    ]
)
