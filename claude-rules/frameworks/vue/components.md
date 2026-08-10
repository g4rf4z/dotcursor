---
paths:
  - "**/*.vue"
---

Files:
- Use `PascalCase` for SFC filenames (e.g. `AppHeader.vue`), matching the component name used in templates

Template conventions:
- Use PascalCase for component tags in SFC templates: `<MyComponent />`; kebab-case tags resolve to the same component since SFC compilation isn't case-sensitive
- Use kebab-case for prop bindings (`greeting-message`) and event listeners (`@some-event`) as a style convention, not a requirement; only in-DOM templates force kebab-case due to HTML's case-insensitivity
- Avoid global registration (`app.component()`); import and use components locally to keep dependencies explicit and tree-shakable

Props:
- Declare props with runtime declaration by default: `defineProps({ foo: { type: String, required: true } })`
- Use `default` for fallback values and `validator(value)` for custom validation logic beyond `type`/`required`
- Order `Boolean` before other types in a multi-type array (`[Boolean, String]`); the reverse order breaks boolean attribute casting
- Use Reactive Props Destructure with default values (Vue 3.5+): `const { foo = 'bar' } = defineProps({ foo: String })`; on 3.4 and earlier, destructured props don't react to changes
- Never mutate props directly; derive local state with `ref(props.initial)` or `computed(() => props.value)`
- Pass destructured props into functions or composables via getter: `useComposable(() => foo)`

Emits:
- Always declare all emitted events explicitly to avoid fallthrough attribute conflicts

v-model:
- Use `defineModel()` (Vue 3.4+) for two-way binding instead of manual prop + emit pattern

Attrs:
- Use `defineOptions({ inheritAttrs: false })` to disable automatic attribute inheritance when you need full control over where attrs land
- Bind `v-bind="$attrs"` explicitly on the intended element in multi-root components; Vue cannot auto-apply fallthrough attrs when there's more than one root element

Slots:
- Prefer named slots over complex prop-passing for layout composition

Provide / Inject:
- Place the injection key in a shared file so it can be imported in multiple components
- Always provide a default value or throw a meaningful error when injecting
- Provide refs or computed values to keep the injected state reactive; wrap it in `readonly()` so only the provider can mutate it, exposing provider-owned methods for consumers to request changes

Expose:
- Use `defineExpose()` only when parent components must imperatively access child state or methods
- Keep the exposed surface minimal
