# homebrew-tap

A [Homebrew](https://brew.sh) tap for e1dred's tools.

## Formulae

| Formula | Description | Platform |
| --- | --- | --- |
| [`weatherpin`](https://github.com/e1dred/weatherpin) | Pin any place to GNOME Weather by typing its name | Linux |

## Installation

Add the tap and install a formula:

```bash
brew tap e1dred/tap https://gitlab.com/e1dred/homebrew-tap.git
brew install weatherpin
```

The URL is needed because Homebrew assumes taps live on GitHub. You only have to
run `brew tap` once.

### Using the GitHub mirror

If this tap is mirrored to GitHub as `e1dred/homebrew-tap`, you can skip the tap
step and install in one command:

```bash
brew install e1dred/tap/weatherpin
```

## Updating

```bash
brew update
brew upgrade weatherpin
```

## Removing

```bash
brew uninstall weatherpin
brew untap e1dred/tap
```

## Notes

- `weatherpin` only makes sense on GNOME. It also needs GNOME Weather (native or
  Flatpak) and your system's `gsettings`, which Homebrew doesn't provide. After
  installing, run `weatherpin --check` to see what, if anything, is missing.

## Troubleshooting

**`No available formula` after tapping.** Run `brew update`, or remove and re-add the tap:

```bash
brew untap e1dred/tap
brew tap e1dred/tap https://gitlab.com/e1dred/homebrew-tap.git
```

**`SHA256 mismatch`.** The formula and the release it points to are out of sync.
Please open an issue.

## Maintainer notes

Releasing a new version of a tool:

1. In the tool's project, update its version, commit, and create a new tag (for example `v0.1.2`).
   Never move or reuse an existing tag.
2. Get the checksum of the tag's tarball:

   ```bash
   curl -L https://github.com/e1dred/weatherpin/archive/refs/tags/v0.1.2.tar.gz | sha256sum
   ```

3. Update `url` and `sha256` in `Formula/weatherpin.rb` (copy only the 64 characters, not the trailing `-`).
4. Test it locally:

   ```bash
   brew audit --strict --online e1dred/tap/weatherpin
   brew install --build-from-source e1dred/tap/weatherpin
   brew test weatherpin
   ```

## License

[BSD Zero Clause License (0BSD)](https://github.com/e1dred/weatherpin/blob/main/LICENSE) — use it however you like.