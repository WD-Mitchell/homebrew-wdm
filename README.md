# WDM Homebrew Tap

Homebrew tap for WDM command-line tools and local developer utilities.

## Install

Tap the repository:

```bash
brew tap WD-Mitchell/wdm
```

Install a formula:

```bash
brew install wdm-ai-management
```

## Available Formulae

Formulae are added by release automation from their source repositories.

| Formula | Description |
| --- | --- |
| `wdm-ai-management` | Local web UI and CLI for managing AI agents, skills, MCP servers, rules, workflows, hooks, templates, and harnesses |

## Maintainers

Formula files live in `Formula/*.rb` and are updated by GitHub Actions from each source repository release.

For WDM AI Management, the source repository workflow writes:

```text
Formula/wdm-ai-management.rb
```

The tap repository should stay small: formula files, this README, and minimal Homebrew metadata only.
