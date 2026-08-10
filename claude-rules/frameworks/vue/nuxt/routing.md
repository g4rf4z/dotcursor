---
paths:
  - "**/nuxt.config.js"
  - "**/nuxt.config.ts"
  - "**/app.vue"
  - "**/pages/**/*.vue"
  - "**/layouts/**/*.vue"
  - "**/middleware/**/*.js"
  - "**/middleware/**/*.ts"
---

File-based routing:
- Code splitting is automatic per route; do not disable it unless measured beneficial

Navigation:
- Use `<NuxtLink to="/path">` for all internal links; it renders an `<a>` with client-side navigation and automatic prefetching
- Never use plain `<a>` tags or manual `router.push()` for declarative navigation
- Use `navigateTo()` for programmatic navigation inside middleware, event handlers, or composables

Middleware:
- Named middleware (`app/middleware/foo.ts`) and global middleware (`app/middleware/foo.global.ts`) both run in the Vue layer; server middleware (`server/middleware/`) is a separate mechanism (see server.md)
