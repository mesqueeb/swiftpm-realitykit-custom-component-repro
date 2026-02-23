// swift-tools-version: 6.2
import PackageDescription

let package = Package(
  name: "RealityKitCustomComponentDecodeRepro",
  platforms: [.macOS(.v26), .iOS(.v26), .visionOS(.v26)],
  products: [
    .library(name: "RealityKitCustomComponentDecodeRepro", targets: ["RealityKitCustomComponentDecodeRepro"])
  ],
  targets: [
    .target(
      name: "RealityKitCustomComponentDecodeRepro",
      resources: [.process("Resources")]
    ),
    .testTarget(
      name: "RealityKitCustomComponentDecodeReproTests",
      dependencies: ["RealityKitCustomComponentDecodeRepro"]
    )
  ]
)
