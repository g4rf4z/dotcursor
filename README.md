# Dotcursor

Personal coding rules shared across editors and projects.

Rules are layered from general to specific, with each layer refining the previous one: core → JavaScript baseline → TypeScript overlay (when applicable).

Styles are layered the same way, in their own stack: core naming → CSS.

## Install

Clone once:

```bash
git clone https://github.com/g4rf4z/dotcursor.git ~/Projects/dotcursor
```

**Cursor**

To use the rules in every project, link the repository as a local plugin:

```bash
ln -s ~/Projects/dotcursor ~/.cursor/plugins/local/dotcursor
```

To use the rules in a single project, link them into that project's `.cursor/rules/` directory instead:

```bash
mkdir -p .cursor/rules
ln -s ~/Projects/dotcursor/rules .cursor/rules/dotcursor
```

Then reload the window (`Developer: Reload Window`) so Cursor picks up the rules.

**Claude Code**

To use the rules in every project, link the Claude Code rules into the user rules directory:

```bash
mkdir -p ~/.claude/rules
ln -s ~/Projects/dotcursor/claude-rules ~/.claude/rules/dotcursor
```

Each rule is scoped to code files with `paths`, so in any project it loads only once Claude reads or edits a matching file.

> [!WARNING]
> Do not link the rules into a project's `.claude/rules/`. Claude Code treats a symlink that points outside the project as an external import and, even after approval, loads only rules without `paths`. Every rule here has `paths`, so none would load.

## Update

Pull the latest changes:

```bash
cd ~/Projects/dotcursor && git pull
```

Every symlink points to the same clone, so a single `git pull` updates the rules for both Cursor and Claude Code, with nothing to reinstall.

## Structure

The same conventions are duplicated in two formats, one per tool, because each tool requires a different rule file extension and frontmatter (Cursor: `.mdc` with `globs`/`alwaysApply`; Claude Code: `.md` with `paths`). Content is kept in sync by hand; see `rules/` for the canonical wording and mirror any change into the matching `claude-rules/` file. Only the frontmatter differs between the two copies.

```
rules/     # Cursor rules (.mdc)
├── core/
│   ├── architecture.mdc
│   ├── clean-code.mdc
│   └── naming.mdc
└── languages/
    ├── css/
    │   └── naming.mdc
    ├── javascript/
    │   ├── conventions.mdc
    │   └── naming.mdc
    └── typescript/
        ├── naming.mdc
        └── typing.mdc
claude-rules/     # Claude Code rules (.md), same layers, same wording
├── core/
└── languages/
.cursor-plugin/
└── plugin.json
```

To cover another file extension, add it to the rule's `globs` in `rules/` and to its `paths` in `claude-rules/`.

> [!NOTE]
> Rules that match no files are silently ignored.
