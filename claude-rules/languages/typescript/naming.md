---
paths:
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.vue"
---

Applies to `.vue` files only when the script block uses `lang="ts"`.

Type suffixes:
- Use `Props` for component prop shapes
- Use `Options` for configuration objects and grouped function or constructor arguments
- Use `Params` for URL and query parameters
- Use `Response` for HTTP or RPC response shapes
- Use `Result` for operation outcomes (success or failure wrappers)
- Use `State` for component or reactive state shapes
- Use `Error` for subclasses of the built-in `Error`

Generic type parameters:
- Bare `T` is fine for trivial single-parameter generics: `identity<T>(value: T): T`
- For multiple parameters or domain meaning, prefix with `T` and name it: `<TKey, TValue>`, `<TInput, TOutput>`
- Never use bare `U`, `V`, `W`. They tell the reader nothing
