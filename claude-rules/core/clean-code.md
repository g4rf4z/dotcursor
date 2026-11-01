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

Code quality:
- Prefer the obvious solution over the clever one when both work
- Apply DRY pragmatically. Two similar blocks can stay; three is a refactor signal

Literals:
- Keep literals inline by default
- Name a literal when any of these applies, even if a key already describes it:
  - It is a tuning value (e.g. page size, threshold, timeout)
  - It is an opaque external code (e.g. `POSTGRESQL_UNIQUE_VIOLATION`, not `'23505'`)
  - The same value with the same meaning appears three times or more
- Otherwise keep it inline, including:
  - Values whose key, parameter, or surrounding names already say what they are (e.g. `padStart(2, '0')`, `quantity: 1`, `unixSeconds * 1000`)
  - Error and log messages

Organization:
- One responsibility per file. Split when concerns drift apart
- Follow the stepdown rule
- Order each file as types, then constants, then functions; within each group, exported declarations come first
- Export a constant only when another module uses it
- Keep a constant in the module that uses it; move it to a constants file only when several modules use it, or when it belongs to a set of values read or changed together (e.g. build-injected values, external API ids, product limits)

Function design:
- A function should have a single, clearly stateable purpose. If you cannot summarize it in one short phrase, split it
- Linear functions can be long (e.g. exhaustive switches, field mappings, sequential setup). Tangled functions (e.g. deep nesting, interleaved concerns, mixed abstraction levels) must be split, whatever their length
- Keep parameters few. When a function takes more than 3 parameters, group related arguments into an options object
- No flag parameters. Boolean arguments that change behavior should become two functions instead
- Use early returns to flatten nesting

Errors:
- Throw early on unexpected states. Do not defer failure to a later layer
- Use a typed, domain-specific error (e.g. `AuthenticationError`, `NotFoundError`, `ValidationError`) when a caller must tell it apart from other errors, for example to redirect, retry, or show a specific message; otherwise a generic error is enough
- Give an error a stable code if and only if it is sent outside the process and the receiver handles it differently from other errors
- Log errors in US English
- Translate user-facing error messages only at the presentation layer
