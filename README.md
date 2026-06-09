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
dockwipe help
```

## Safe Cleanup

Preview what Dockwipe will do:

```bash
dockwipe plan
```

Run safe cleanup:

```bash
dockwipe clean
```

Automation-friendly cleanup:

```bash
dockwipe clean --yes
```

## Commands

| Command | Purpose |
|---|---|
| `status` | Show Docker disk usage |
| `analyze` | Show Docker usage details |
| `plan` | Preview safe cleanup behavior |
| `clean` | Clean unused resources without stopping running services |
| `--yes` | Skip confirmation for safe automation |
| `--dry-run` | Print actions without executing them |

## Safety

`clean` uses Docker prune behavior. It does not remove running containers or Docker resources still referenced by containers.

By default:

- volumes are skipped
- build cache is skipped
- running services are preserved

Manual destructive commands are isolated under:

```bash
dockwipe danger help
```

Danger commands include broad cleanup and reset operations:

```bash
dockwipe danger cache
dockwipe danger volumes
dockwipe danger full
```

They require an exact confirmation phrase and ignore `--yes`. Do not run them from cron.

## Cron

Create the log directory:

```bash
sudo mkdir -p /var/log/dockwipe
```

Run safe cleanup every morning at 10 AM:

```cron
0 10 * * * /usr/local/bin/dockwipe clean --yes >> /var/log/dockwipe/cleanup.log 2>&1
```

## Requirements

- Linux
- Docker
- Bash

## License

MIT
