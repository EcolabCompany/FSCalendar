// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FSCalendar",
    platforms: [
        .iOS(.v8),
    ],
    products: [
        .library(
            name: "FSCalendar",
//            type: .dynamic,
            targets: ["FSCalendar"])
    ],
    targets: [
        .target(name: "FSCalendar", publicHeadersPath: "Include")
    ]
)
