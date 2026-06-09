# Dockwipe

![License](https://img.shields.io/badge/license-MIT-blue)
![Language](https://img.shields.io/badge/language-bash-green)
![Platform](https://img.shields.io/badge/platform-linux-lightgrey)
![Docker](https://img.shields.io/badge/docker-supported-blue)

dockwipe is a lightweight command-line utility for inspecting and safely cleaning Docker environments on development machines.

If you work with Docker regularly, containers, images, volumes, networks, and build cache tend to accumulate over time. dockwipe provides a simple way to check what is consuming disk space and clean unused resources without touching running services.



## Why dockwipe?

Docker environments on development machines can quickly become cluttered with unused containers, images, and volumes.

dockwipe was built to make it easier to:

- inspect Docker disk usage
- clean unused Docker resources without stopping running services
- reset Docker environments when they become messy
- maintain clean development and testing environments

It is especially useful for developers, DevOps engineers, and lab environments where containers are created and destroyed frequently.



## Installation

Clone the repository and run the installation script.

```bash
git clone https://github.com/YOUR_USERNAME/dockwipe.git
cd dockwipe
chmod +x dockwipe install.sh
./install.sh
```

The installation script copies the CLI tool to:

```
/usr/local/bin/dockwipe
```

Verify installation:

```bash
dockwipe --help
```


## Usage

Preview safe cleanup:

```bash
dockwipe --plan
```

Run safe cleanup:

```bash
dockwipe --safe
```

Run safe cleanup for automation:

```bash
dockwipe --safe --yes
```

Use a retention filter:

```bash
dockwipe --safe --older-than 7d --yes
```

Analyze Docker environment:

```bash
dockwipe --analyze
```

Show Docker disk usage:

```bash
dockwipe --status
```

Run smart cleanup:

```bash
dockwipe --smart
```

Preview destructive operation without executing it:

```bash
dockwipe --dry-run --full
```

Fully reset Docker environment:

```bash
dockwipe --full
```

---

## Available Commands

| Command | Description |
|------|------|
| `--analyze` | Analyze Docker disk usage and environment |
| `--status` | Show `docker system df` output |
| `--plan` | Preview safe cleanup behavior |
| `--safe` | Clean unused Docker resources while preserving running services |
| `--older-than` | Apply Docker prune retention filter, for example `7d` or `24h` |
| `--yes` | Skip confirmation for automation |
| `--prune-build-cache` | Include build cache in `--safe` cleanup |
| `--prune-anonymous-volumes` | Include anonymous unused volumes in `--safe` cleanup |
| `--smart` | Legacy cleanup using Docker prune commands |
| `--containers` | Remove all containers |
| `--images` | Remove all images |
| `--volumes` | Remove all volumes |
| `--networks` | Remove custom Docker networks |
| `--cache` | Clean Docker build cache |
| `--full` | Fully reset Docker environment |
| `--dry-run` | Preview actions without executing |
| `--version` | Show dockwipe version |


## Requirements

- Linux
- Docker installed
- Bash shell


## Notes

- `--safe` uses Docker prune behavior and does not remove running containers or Docker resources still referenced by containers.
- Volumes are skipped by default in `--safe`.
- Build cache is skipped by default in `--safe`; use `--prune-build-cache` to include it.
- You can set a default retention value with `DOCKWIPE_OLDER_THAN` or `/etc/dockwipe/config`.
- `--full` removes everything under:

```
/var/lib/docker
/var/lib/containerd
```

- Banner and colors appear only in interactive terminals.
- Use `--no-color` if you prefer plain output.
- If permission errors occur, run the command with `sudo` or add your user to the Docker group.

## Cron

Run safe cleanup every morning at 10 AM:

```cron
0 10 * * * /usr/local/bin/dockwipe --safe --yes >> /var/log/dockwipe/cleanup.log 2>&1
```

With explicit retention and build cache cleanup:

```cron
0 10 * * * /usr/local/bin/dockwipe --safe --older-than 7d --prune-build-cache --yes >> /var/log/dockwipe/cleanup.log 2>&1
```

Create the log directory first:

```bash
sudo mkdir -p /var/log/dockwipe
```

## License

MIT License

