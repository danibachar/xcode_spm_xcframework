// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

typealias Products = [[Product]]
typealias Dependencies = [[Package.Dependency]]
typealias Targets = [[Target]]

let package = Package(
    name: "Test",
    defaultLocalization: "en",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: Products([
        .A(),
        .B(),
    ]).flatMap { $0 },
    dependencies: Dependencies([
        .TestDependencies(),
        .MarketingDependencies(),
    ]).flatMap { $0 },
    targets: Targets([
        .A(),
        .B(),
    ]).flatMap { $0 }
)

// MARK: - External Dependencies
extension Collection {
    static func TestDependencies() -> [Package.Dependency] where Element == Package.Dependency {
        [
            .package(url: "https://github.com/Brightify/Cuckoo.git", from: "1.9.1")
        ]
    }

    
    static func MarketingDependencies() -> [Package.Dependency] where Element == Package.Dependency {
        [
            .package(url: "https://github.com/comScore/Comscore-Swift-Package-Manager.git",
                    exact: "6.8.1")
        ]
    }
}

// MARK: - A
extension Collection {
    static func A() -> [Target] where Element == Target {
        [
            .target(
                name: "A",
                dependencies: [
                    .productItem(name: "ComScore", package: "Comscore-Swift-Package-Manager")
                ]),
            .testTarget(name: "ATests",
                        dependencies: [
                            "A",
                            .product(name: "Cuckoo", package: "Cuckoo"),
                        ]),
        ]
    }
    
    static func A() -> [Product] where Element == Product {
        [
            .library(
                name: "A",
//                type: .static,
                targets: ["A"]),
        ]
    }
}

// MARK: - B
extension Collection {
    static func B() -> [Target] where Element == Target {
        [
            .target(
                name: "B",
                dependencies: [
                    "A"
                ]),
            .testTarget(name: "BTests",
                        dependencies: [
                            "B",
                            .product(name: "Cuckoo", package: "Cuckoo"),
                        ]),
        ]
    }
    
    static func B() -> [Product] where Element == Product {
        [
            .library(
                name: "B",
//                type: .static,
                targets: ["B"]),
        ]
    }
}
