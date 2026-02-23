# Swiftpm Realitykit Custom Component Repro

in SwiftPM CLI tests, RealityKit custom components are detected by `has(...)` but typed decoding via `components[...]` returns nil.

## Bug reproduction steps

```bash
swift test --filter componentsPresentButNotDecodableInSwiftTest
```

Expected:

- raw count == decoded count
- decoded `marker == "from_usd"`

Observed (on affected setup):

- raw count `1`
- decoded count `0`

## Details

This is a standalone Swift package with no package dependencies.

It contains:

- one custom RealityKit component (`ReproComponent`)
- one tiny local USDA resource (`Repro.usda`) with that custom component attached
- one test that loads the USDA and compares raw-vs-typed component access

The issue reproduced in CLI `swift test`:

- `entity.components.has(ReproComponent.self)` is `true`
- but `entity.components[ReproComponent.self]` is `nil`
