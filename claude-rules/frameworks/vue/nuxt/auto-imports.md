---
paths:
  - "**/app.vue"
  - "**/app/**/*.vue"
  - "**/app/**/*.js"
  - "**/app/**/*.ts"
  - "**/composables/**/*.js"
  - "**/composables/**/*.ts"
  - "**/utils/**/*.js"
  - "**/utils/**/*.ts"
  - "**/server/**/*.js"
  - "**/server/**/*.ts"
---

Built-in auto-imports:
- Never manually import what Nuxt auto-imports (Vue APIs, Nuxt composables like `useFetch`/`useRoute`/`useState`, and components under `app/components/`); rely on the auto-import or use `#imports` for explicit imports. This refines, not contradicts, the Vue-layer preference for local component imports — auto-imported components stay scoped and tree-shakable, just without an explicit import line
- Use `#imports` alias when you need an explicit import for clarity or tooling reasons

Lifecycle context:
- Composables relying on Nuxt context must be called inside `<script setup>`, `setup()`, Nuxt plugins, or route middleware (see composables.md for the general script-setup/await rule)
- Never call Nuxt composables at module top-level outside these contexts: `const config = useRuntimeConfig()` at file root causes errors
- Wrap Nuxt composable calls inside the composable function body: `export const useX = () => { const config = useRuntimeConfig(); ... }`
