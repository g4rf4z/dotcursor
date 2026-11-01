---
paths:
  - "**/*.cjs"
  - "**/*.css"
  - "**/*.html"
  - "**/*.js"
  - "**/*.jsx"
  - "**/*.mjs"
  - "**/*.scss"
  - "**/*.ts"
  - "**/*.tsx"
  - "**/*.vue"
---

Content:
- Comment only context the code cannot express (e.g. a non-obvious constraint, a tradeoff, why not the obvious way); never paraphrase the code

Wording:
- Write every comment in US English
- Write comments as full sentences that start with a capital letter and end with a period (e.g. `The value is checked first.`, not `Checked first.`)
- Wrap every code identifier and literal value in backticks, including at the start of a sentence (e.g. `` `--space-4` ``, `` `fetchUser()` ``, `` `null` ``)

Placement:
- Place each comment on its own line, directly above the code it describes; never at the end of a line of code
- Wrap comments at the project's line length (e.g. Prettier `printWidth`), or at 100 characters when the project sets none
- When a comment describes a whole block (e.g. a CSS rule, a function, an `if` statement), place it directly above the block's opening line, not inside it

Block comments:
- Keep a block comment (one with opening and closing delimiters) on a single line when it fits, delimiters included
- When a block comment spans several lines, put the opening and closing delimiters on their own lines

Tool directives:
- Tool directives (e.g. `prettier-ignore`, `stylelint-disable-next-line`, `eslint-disable-next-line`) follow their tool's syntax and are exempt from every comment rule
- When a tool offers a directive placed above the line, use it (e.g. `eslint-disable-next-line`, not `eslint-disable-line`)
