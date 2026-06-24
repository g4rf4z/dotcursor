# dotcursor

Cursor rules and plugin configuration shared across projects.

## Install

From any project root:

```bash
curl -s https://raw.githubusercontent.com/g4rf4z/dotcursor/main/install.sh | bash
```

## Update

Same command. It replaces the entire `.cursor/` directory with the latest version from this repository:

```bash
curl -s https://raw.githubusercontent.com/g4rf4z/dotcursor/main/install.sh | bash
```

## Check installed version

```bash
cat .cursor/.version
```

## Structure

```
rules/
├── core/
│   ├── clean-code.mdc
│   └── naming-conventions.mdc
└── languages/
    └── typescript/
        ├── naming.mdc
        └── semantics.mdc
.cursor-plugin/
└── plugin.json
.version
```

## Shell alias (optional)

Add to `~/.zshrc` for quick updates:

```bash
alias dotcursor-update='curl -s https://raw.githubusercontent.com/g4rf4z/dotcursor/main/install.sh | bash'
```

## Notes

- Cursor automatically loads rules from `.cursor/rules/`.
- `.cursor/` is fully managed by this repository. Do not store anything else there, as it gets wiped on update.
- Do not edit rules directly inside projects. Update this repo, then re-run the install command.
- `.cursor/.version` tracks the installed commit hash and installation date.
