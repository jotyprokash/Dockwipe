# Dockwipe

![License](https://img.shields.io/badge/license-MIT-blue)
![Language](https://img.shields.io/badge/language-bash-green)
![Platform](https://img.shields.io/badge/platform-linux-lightgrey)
![Docker](https://img.shields.io/badge/docker-supported-blue)

Dockwipe is a small Bash CLI for inspecting and safely cleaning Docker usage on development servers.

It is designed to remove unused Docker clutter while preserving running services and Docker resources still in use.

## Install

```bash
git clone https://github.com/jotyprokash/Dockwipe.git
cd Dockwipe
chmod +x dockwipe install.sh
./install.sh
```

Verify:

```bash
dockwipe --help
```

## Safe Cleanup

Preview what Dockwipe will do:

```bash
dockwipe --plan
```

Run safe cleanup:

```bash
dockwipe --safe
```

Automation-friendly cleanup:

```bash
dockwipe --safe --yes
```

Use a retention filter:

```bash
dockwipe --safe --older-than 7d --yes
```

Include build cache cleanup:

```bash
dockwipe --safe --older-than 7d --prune-build-cache --yes
```

## Commands

| Command | Purpose |
|---|---|
| `--plan` | Preview safe cleanup behavior |
| `--safe` | Clean unused resources without stopping running services |
| `--status` | Show Docker disk usage |
| `--analyze` | Show Docker usage details |
| `--older-than VALUE` | Apply a Docker prune retention filter, for example `7d` or `24h` |
| `--yes` | Skip confirmation for safe automation |
| `--prune-build-cache` | Include build cache in `--safe` cleanup |
| `--prune-anonymous-volumes` | Include anonymous unused volumes in `--safe` cleanup |
| `--dry-run` | Print actions without executing them |

## Safety

`--safe` uses Docker prune behavior. It does not remove running containers or Docker resources still referenced by containers.

By default:

- volumes are skipped
- build cache is skipped
- running services are preserved

Manual destructive commands still exist for emergency/admin use:

```bash
dockwipe --containers
dockwipe --images
dockwipe --volumes
dockwipe --networks
dockwipe --full
```

Do not run those from cron.

## Cron

Create the log directory:

```bash
sudo mkdir -p /var/log/dockwipe
```

Run safe cleanup every morning at 10 AM:

```cron
0 10 * * * /usr/local/bin/dockwipe --safe --yes >> /var/log/dockwipe/cleanup.log 2>&1
```

With retention and build cache cleanup:

```cron
0 10 * * * /usr/local/bin/dockwipe --safe --older-than 7d --prune-build-cache --yes >> /var/log/dockwipe/cleanup.log 2>&1
```

## Requirements

- Linux
- Docker
- Bash

## License

MIT
