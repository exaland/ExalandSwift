// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExalandSwift",
    platforms: [
        .macOS(.v26)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ExalandSwift",
            targets: ["ExalandSwift"]
            
        ),
    ],
    dependencies: [
        
        .package(url: "https://github.com/exaland/PreferenceKit.git", branch: "main"),
        .package(url: "https://github.com/exaland/OSLogViewer.git", branch: "main")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ExalandSwift",
            dependencies: [
                .product(name: "OSLogViewer", package: "OSLogViewer"),
                .product(name: "PreferenceKit", package: "PreferenceKit")
            ],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
        .testTarget(
            name: "ExalandSwiftTests",
            dependencies: ["ExalandSwift"],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ],
        ),
    ]
)
