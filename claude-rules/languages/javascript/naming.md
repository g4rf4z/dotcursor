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
- Use `kebab-case` for filenames: `date-utils.ts`, `user-service.ts`, `validation-schema.ts`

Functions and methods:
- Use verb-first names for actions: `fetchUser`, `parseInput`, `sendEmail`
- Use `get*` for side-effect-free non-boolean functions that retrieve or compute a value: `getCurrentTime`, `getUserName`, `getVisibleItem`
- Prefix booleans and boolean-returning functions with `can`, `has`, `is`, or `should`: `canEdit`, `hasAccess`, `isReady`

Types and classes:
- Use `PascalCase` for classes and type-like names

Variables and properties:
- Use `camelCase`
- Pluralize arrays and other collections: `errors`, `items`, `users`

Constants:
- Reserve `UPPER_SNAKE_CASE` for module-level constants and fixed magic values; everyday `const` bindings use `camelCase`
