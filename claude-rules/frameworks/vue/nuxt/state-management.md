---
paths:
  - "**/app.vue"
  - "**/layouts/**/*.vue"
  - "**/pages/**/*.vue"
  - "**/composables/**/*.js"
  - "**/composables/**/*.ts"
---

useState:
- Use `useState<T>(key, () => initialValue)` as the SSR-friendly replacement for `ref()` when sharing state across components
- Value must be JSON-serializable: no classes, functions, or symbols

Shared state safety:
- Never declare `const state = ref()` or `export const state = ref()` at module top-level; this leaks state across requests on the server
- Always wrap shared state in a composable: `export const useColor = () => useState<string>('color', () => 'pink')`

Initialization:
- Use `callOnce(async () => { ... })` in `app.vue` or layouts to initialize global state once (similar to Nuxt 2 `nuxtServerInit`)
- Do not use `useAsyncData` to trigger side effects like Pinia actions; use `callOnce` instead

Pinia:
- Define stores with `defineStore()` using the setup syntax for Composition API consistency
