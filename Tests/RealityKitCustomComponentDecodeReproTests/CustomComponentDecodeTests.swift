import RealityKit
import Testing
@testable import RealityKitCustomComponentDecodeRepro

@Suite(.serialized) struct CustomComponentDecodeTests {
  @MainActor @Test func componentsPresentButNotDecodableInSwiftTest() async throws {
    ReproComponent.registerComponent()

    let loaded = try await Entity(named: "Repro.usda", in: reproBundle)
    let allEntities = allDescendants(includingRoot: loaded)

    let raw = allEntities.filter { $0.components.has(ReproComponent.self) }
    #expect(!raw.isEmpty)

    let decoded = raw.filter { $0.components[ReproComponent.self] != nil }

    #expect(
      decoded.count == raw.count,
      "ReproComponent decode mismatch: decoded=\(decoded.count) raw=\(raw.count)"
    )

    #expect(decoded.first?.components[ReproComponent.self]?.marker == "from_usd")
  }

  @MainActor private func allDescendants(includingRoot root: Entity) -> [Entity] {
    var result: [Entity] = [root]
    var i = 0
    while i < result.count {
      let entity = result[i]
      for child in entity.children { result.append(child) }
      i += 1
    }
    return result
  }
}
