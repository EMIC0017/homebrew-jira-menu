# homebrew-jira-menu

A [Homebrew](https://brew.sh/) tap for [JiraMenu](https://github.com/EMIC0017/jira-menu) — a macOS menubar app for fast Jira Cloud search.

## Install

```sh
brew tap EMIC0017/jira-menu
brew install --cask --no-quarantine jira-menu
```

The `--no-quarantine` flag bypasses Gatekeeper's right-click-Open dance on first launch. JiraMenu is ad-hoc signed (no Apple Developer account), so Gatekeeper would otherwise block it without that flag.

## Update

```sh
brew upgrade --cask jira-menu
```

## Uninstall

```sh
brew uninstall --cask --zap jira-menu
```

`--zap` removes Preferences + any app data along with the app itself.

## What this tap contains

One cask: `Casks/jira-menu.rb`. Every JiraMenu release gets a version + sha256 bump here, so `brew upgrade` pulls the new binary from the main repo's GitHub Releases.
