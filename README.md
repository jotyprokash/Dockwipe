# dockwipe

A small CLI for keeping Docker tidy on dev boxes and lab machines.
It can also do a full factory reset when you need Docker back to a clean slate.

## What it does

- `--analyze` : quick view of what's taking space (images/volumes/containers + Docker directories)
- `--status`  : `docker system df`
- `--smart`   : removes unused resources (daily cleanup)
- targeted cleanup: `--containers` `--images` `--volumes` `--networks` `--cache`
- `--full`    : factory reset (wipes Docker + containerd state)

## Install

```bash
chmod +x dockwipe install.sh
./install.sh
```

## Usage

Analyze:

```bash
dockwipe --analyze
```

Daily cleanup:

```bash
dockwipe --smart
```

Dry-run (prints commands, doesn't delete anything):

```bash
dockwipe --dry-run --full
```

Factory reset (destructive):

```bash
dockwipe --full
```

## Notes

- `--full` removes everything under `/var/lib/docker` and `/var/lib/containerd`.
- Banner/colors show only in interactive terminals. Use `--no-color` if you prefer plain output.
- If you get permission errors, add your user to the docker group or run with sudo.

## License

MIT
