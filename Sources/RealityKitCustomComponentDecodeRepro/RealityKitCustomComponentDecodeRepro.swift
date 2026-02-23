import Foundation
import RealityKit

public let reproBundle: Bundle = .module

public struct ReproComponent: Component, Codable, Sendable {
  public static var componentName: String { "RealityKitCustomComponentDecodeRepro.ReproComponent" }

  public var marker: String = ""

  public init() {}

  private enum CodingKeys: String, CodingKey { case marker }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.marker = try container.decodeIfPresent(String.self, forKey: .marker) ?? ""
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(marker, forKey: .marker)
  }
}
