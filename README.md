# chenghsj/homebrew-secly

Official Homebrew tap for Secly.

This repository contains the Homebrew formula for installing Secly from the command line.

## Install

```bash
brew tap chenghsj/homebrew-secly
brew install secly
```

## Upgrade

```bash
brew upgrade secly
```

## Uninstall

```bash
secly uninstall --force
brew uninstall secly
```

`brew uninstall secly` only removes the Homebrew-managed files. Run `secly uninstall --force` first to remove Secly's local runtime data under your home directory.

## Maintainers

After publishing a new Secly release artifact, regenerate the tap scaffold from the main project repository and copy the updated files into this tap repository.

## Project

- Project: https://github.com/chenghsj/secly
- Releases: https://github.com/chenghsj/secly/releases
- Release artifact: secly-0.1.3-standalone.tar.gz

