---
paths:
  - "**/*.cjs"
  - "**/*.js"
  - "**/*.jsx"
  - "**/*.mjs"
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.vue"
---

Layers:
- Use Clean Architecture with four layers, from inner to outer: entities, use cases, adapters, frameworks and UI
- Write one use case per application action (e.g. `cancelSubscription`, `publishPost`, `sendMessage`)

Boundaries:
- Use cases reach external systems (e.g. geolocation, HTTP, storage) only through ports they declare. Adapters implement those ports
- Pass adapters to use cases as function arguments; do not add a dependency injection library

Scope:
- Create use cases and ports when a feature has business logic (e.g. calculations, decisions, validation)
- When a feature only fetches and displays data, the UI may call an adapter directly
