// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "ProtocolMembers",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "ProtocolMembers",
            targets: ["ProtocolMembers"]
        ),
        .executable(
            name: "ProtocolMembersClient",
            targets: ["ProtocolMembersClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "ProtocolMembersMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(name: "ProtocolMembers", dependencies: ["ProtocolMembersMacros"]),

        // A client of the library, which is able to use the macro in its own code.
        .executableTarget(name: "ProtocolMembersClient", dependencies: ["ProtocolMembers"]),
    ]
)
