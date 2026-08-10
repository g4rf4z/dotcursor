---
paths:
  - "**/*.vue"
  - "**/composables/**/*.js"
  - "**/composables/**/*.ts"
---

Naming:
- Name composable functions with camelCase starting with `use`: `useMouse`, `useAuth`
- Place composable files in `composables/` directory

Structure:
- Extract composables to organize a single large component's logic into focused, named units, not only to reuse logic across components

Inputs:
- Accept `Ref`, getter, or plain values as arguments for maximum flexibility
- Normalize inputs with `toValue()` inside watchers or `watchEffect` so dependencies are tracked
- If the composable creates reactive effects, explicitly `watch()` or use `toValue()` inside `watchEffect()`

Return values:
- Always return a plain object containing refs, not a reactive object, so consumers can destructure while retaining reactivity

Side effects:
- Perform DOM-specific side effects in `onMounted()` for SSR compatibility
- Clean up side effects (event listeners, timers, subscriptions) in `onUnmounted()`
- Extract event listener setup into a helper composable (e.g. `useEventListener`) for automatic cleanup

Lifecycle restrictions:
- Call composables synchronously inside `<script setup>` or `setup()` only
- Never call composables inside `setTimeout`, `setInterval`, or after a non-setup `await`
- In `<script setup>`, composables can be called after `await` (compiler restores context)
