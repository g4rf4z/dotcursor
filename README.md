# dotcursor

Cursor plugin configuration shared across projects.

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

Rules compose as a funnel, from broad to specific: core → JavaScript baseline → TypeScript overlay (when applicable) → framework → framework TypeScript overlay (when applicable) → meta-framework.

```
rules/
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
    ├── react/          # reserved, no rules yet
    └── vue/
        ├── components.mdc
        ├── composables.mdc
        ├── performance.mdc
        ├── reactivity.mdc
        ├── composition-api.mdc
        ├── typescript.mdc          # Vue + TypeScript overlay
        └── nuxt/          # Nuxt overlay
            ├── auto-imports.mdc
            ├── data-fetching.mdc
            ├── routing.mdc
            ├── server.mdc
            └── state-management.mdc
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

