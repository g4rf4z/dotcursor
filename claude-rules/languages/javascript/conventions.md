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

Modules:
- Use ES modules by default; fall back to CommonJS only when required by the config format or surrounding tool
- Use named exports by default; reserve default exports for framework-required entry points (e.g. config files, Next.js pages, Nuxt plugins)

Errors:
- Implement domain-specific error types (see core/clean-code) by extending the built-in `Error` class

Constants:
- Group related constants inside an object literal when they form a lookup table (e.g. error codes, route paths, settings); keep standalone constants otherwise

Async code:
- Prefer `async` functions and `await` over Promise `.then()` chains
