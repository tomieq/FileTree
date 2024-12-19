# FileTree is simple library to dump content of directory

```swift
let output = FileTree().tree
let output = FileTree("/Users/tomieq/tmp/to_delete/filetree").tree
let output = FileTree().tree { url, isDir in
    url.absoluteString
}
print(output)
```
## Installation

```swift
// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SomeApp",
    dependencies: [
        .package(url: "https://github.com/tomieq/FileTree", from: "1.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "SomeApp",
            dependencies: [
                .product(name: "FileTree", package: "FileTree")
            ]),
    ]
)
```
