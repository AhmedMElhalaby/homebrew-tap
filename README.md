# homebrew-tap

Homebrew tap for the [`ainkrad`](https://github.com/AhmedMElhalaby/AinkradKit) CLI.

## Install

```
brew install AhmedMElhalaby/tap/ainkrad
```

## Unsigned / dev channel

Real Developer-ID notarization is blocked on Apple enrollment (AIN-135). Releases
built before that lands are **unsigned**. Gatekeeper will refuse to run an unsigned
binary downloaded via a browser; if you hit that after installing via `brew` (which
does not apply the quarantine flag the same way `curl`/browser downloads do), clear
the quarantine attribute yourself:

```
xattr -d com.apple.quarantine "$(brew --prefix)/bin/ainkrad" 2>/dev/null || true
```

Or download the release asset directly and do the same:

```
curl -LO https://github.com/AhmedMElhalaby/AinkradKit/releases/download/<version>/ainkrad-<version>-macos.zip
unzip ainkrad-<version>-macos.zip
xattr -d com.apple.quarantine ainkrad
./ainkrad --help
```

Once Developer-ID enrollment lands, `AinkradKit/scripts/release-cli.sh --notarize`
will notarize and staple releases with no further changes to this tap or formula.

## Formula

`Formula/ainkrad.rb` is a precompiled-binary formula. Its `version`, `url`, and
`sha256` are placeholders in this repo's initial state — they are overwritten by
`AinkradKit/scripts/release-cli.sh` on every release.
