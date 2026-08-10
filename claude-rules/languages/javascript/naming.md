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

Files:
- Use `kebab-case` for filenames (e.g. `user-service.ts`, `date-utils.ts`)

Functions and methods:
- Verb-first for actions: `fetchUser`, `parseInput`, `sendEmail`
- Noun or `get*` for side-effect-free getters and computed values: `userName`, `getCurrentTime`
- Prefix booleans and boolean-returning functions with `is`, `has`, `should`, or `can`: `isReady`, `hasAccess`, `shouldRetry`

Classes and types:
- Use `PascalCase` for classes and type-like names

Variables and properties:
- Use `camelCase`
- Pluralize arrays and other collections: `users`, `items`, `errors`

Constants:
- Reserve `UPPER_SNAKE_CASE` for true constants (module-level config, magic values); everyday `const` bindings follow normal `camelCase` variable naming
