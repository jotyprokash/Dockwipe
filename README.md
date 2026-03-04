# Dockwipe

![License](https://img.shields.io/badge/license-MIT-blue)
![Language](https://img.shields.io/badge/language-bash-green)
![Platform](https://img.shields.io/badge/platform-linux-lightgrey)
![Docker](https://img.shields.io/badge/docker-supported-blue)

dockwipe is a lightweight command-line utility for inspecting, cleaning, and resetting Docker environments on development machines.

If you work with Docker regularly, containers, images, volumes, and networks tend to accumulate over time. dockwipe provides a simple way to check what is consuming disk space, clean unused resources, and fully reset Docker when needed.



## Why dockwipe?

Docker environments on development machines can quickly become cluttered with unused containers, images, and volumes.

dockwipe was built to make it easier to:

- inspect Docker disk usage
- clean unused Docker resources
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
| `--smart` | Remove unused Docker resources |
| `--containers` | Remove all containers |
| `--images` | Remove all images |
| `--volumes` | Remove all volumes |
| `--networks` | Remove custom Docker networks |
| `--cache` | Clean Docker build cache |
| `--full` | Fully reset Docker environment |
| `--dry-run` | Preview actions without executing |
| `--version` | Show dockwipe version |

---

## Project Structure

```
dockwipe
├── dockwipe          # main CLI script
├── install.sh        # installation helper
├── README.md         # project documentation
├── LICENSE
└── docs
    └── usage.md
```

---

## Requirements

- Linux
- Docker installed
- Bash shell

---

## Notes

- `--full` removes everything under:

```
/var/lib/docker
/var/lib/containerd
```

- Banner and colors appear only in interactive terminals.
- Use `--no-color` if you prefer plain output.
- If permission errors occur, run the command with `sudo` or add your user to the Docker group.

---

## License

MIT License

---

