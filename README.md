# dotcursor

Personal coding rules shared across projects and editors (Cursor and Claude Code).

Rules compose as a funnel, from broad to specific: core → JavaScript baseline → TypeScript overlay (when applicable) → framework → framework TypeScript overlay (when applicable) → meta-framework.

## Install

Clone once:

```bash
git clone https://github.com/g4rf4z/dotcursor.git ~/dev/dotcursor
```

**Cursor**

Global, for every project on your machine — link the repo as a local plugin:

```bash
ln -s ~/dev/dotcursor ~/.cursor/plugins/local/dotcursor
```

Then reload the window (`Developer: Reload Window`). Cursor reads `rules/` (`.mdc` files) at the plugin root.

Scoped to a single project — link the rules into that project's rules directory instead:

```bash
mkdir -p .cursor/rules
ln -s ~/dev/dotcursor/rules .cursor/rules/dotcursor
```

**Claude Code**

Global, for every project on your machine — link the Claude-flavored rules into your rules directory:

```bash
ln -s ~/dev/dotcursor/claude-rules ~/.claude/rules/dotcursor
```

Scoped to a single project — link into that project's rules directory instead:

```bash
mkdir -p .claude/rules
ln -s ~/dev/dotcursor/claude-rules .claude/rules/dotcursor
```

## Update

```bash
cd ~/dev/dotcursor && git pull
```

Both symlinks point into the same clone, so a `git pull` updates Cursor and Claude Code at once. Nothing to reinstall.

## Structure

The same conventions are duplicated in two formats, one per tool, because each tool requires a different rule file extension and frontmatter (Cursor: `.mdc` with `globs`/`alwaysApply`; Claude Code: `.md` with `paths`). Content is kept in sync by hand; see `rules/` for the canonical wording and mirror any change into the matching `claude-rules/` file.

```
rules/                     # Cursor rules (.mdc)
├── core/
│   ├── clean-code.mdc
│   └── naming.mdc
├── languages/
│   ├── javascript/
│   │   ├── conventions.mdc
│   │   └── naming.mdc
│   └── typescript/
│       ├── naming.mdc
│       └── typing.mdc
└── frameworks/
    ├── react/            # coming soon
    └── vue/
        ├── components.mdc
        ├── composables.mdc
        ├── performance.mdc
        ├── reactivity.mdc
        ├── composition-api.mdc
        ├── typescript.mdc          # Vue + TypeScript overlay
        └── nuxt/                    # Nuxt overlay
            ├── auto-imports.mdc
            ├── data-fetching.mdc
            ├── routing.mdc
            ├── server.mdc
            └── state-management.mdc
claude-rules/               # Claude Code rules (.md), same funnel, same wording
├── core/
├── languages/
└── frameworks/
.cursor-plugin/
└── plugin.json
```



## Adapting the globs to your layout

Rules attach based on file path patterns, and the framework rules assume Nuxt 4's default layout: `pages/`, `layouts/`, `composables/`, `middleware/`, and `utils/` nested under `app/`, with `server/` as the one top-level sibling. Every glob is prefixed with `**/`, so it matches these directories at any depth — Nuxt 3's flat layout (`pages/` at the root, no `app/`) still works with no edits needed. If your project puts these elsewhere still (for example everything under `src/`), edit the `globs` line in the affected `.mdc` file and the matching `paths:` list in its `claude-rules/` counterpart. A rule whose patterns never match simply never applies, with no warning.

The `core/` rules apply unconditionally and need no adjustment.

## Notes

- Cursor loads rules from the plugin's `rules/` directory once linked into `~/.cursor/plugins/local/`, or recursively from a project's own `.cursor/rules/` when scoped there instead.
- Claude Code loads rules recursively from `.claude/rules/`, applying path-scoped ones (`paths:` frontmatter) only when a matching file is opened, and unconditional ones (no frontmatter) every session.
- Edit rules only in this repo, never in a project's copy — there is no copy, both editors read through the symlink.

