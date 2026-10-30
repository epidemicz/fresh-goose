# fresh-goose

Goose language support for [Fresh](https://getfresh.dev): syntax highlighting,
LSP (`goose lsp`) and formatting (`goose format`) for `.goose` files.

## Prerequisites

- The `goose` compiler on your `PATH`.
- The Goose standard library must be resolvable: via `GOOSE_STDLIB`, or a
  `stdlib/` directory next to the `goose` executable. Otherwise extend the
  commands below with `--stdlib /path/to/goose/stdlib`.

## Install

In Fresh: `Ctrl+P`, type `>`, run "Package: Install from URL" with:

```
https://github.com/epidemicz/fresh-goose
```


## Multi-file programs (optional LSP entry files)

By default `goose lsp` analyzes each open file as a program of its own,
together with the files it imports — no configuration needed. Only if you
work on a multi-file program and want a module checked as part of its
importing program (whole-program errors shown in the module) should you
name the program's entry file in your Fresh `config.json`, as an absolute
path:

```json
"lsp": { "goose": { "command": "goose", "args": ["lsp"],
  "initialization_options": { "entryFiles": ["/abs/path/to/main.goose"] } } }
```

## Formatting

`textDocument/formatting` from the LSP covers in-editor format; the pack's
`formatter` entry (`goose format <file>`, in-place rewrite) covers formatting
without the LSP running.

## Known limitations

Contextual keywords (`from`, `upto`, `inline`, `checkfree`, `fields`, `types`,
`variants`) are intentionally unscoped plain text — the upstream VS Code
grammar does not scope them either, and inventing scopes would diverge from it.

## CI

- `ci.yml` (push/PR): validates `package.json` against the Fresh schema, then
  installs the pinned Goose release (`GOOSE_VERSION v2026.3`) and runs
  `goose check`, `goose format --check`, and `goose run` (stdout-compared) on
  `examples/hello.goose`. Fresh packs ship no build artifacts — install is a
  git clone — so CI is validation-only.
- `nightly.yml` (scheduled, notify-only): builds `goose` from upstream `master`,
  re-runs `check` + `format --check`, and diffs the upstream
  `vscode/syntaxes/goose.tmLanguage.json` keyword/builtin sets against the
  shipped grammar. It never uploads artifacts and never gates PRs; a red run
  means upstream drifted and the grammar may need a parity edit.

## Credits

The grammar in `grammars/goose.sublime-syntax` is ported from the
[Goose](https://github.com/aardappel/goose) VS Code grammar
(`vscode/syntaxes/goose.tmLanguage.json`), used under the Apache License 2.0
(see `grammars/LICENSE`).
