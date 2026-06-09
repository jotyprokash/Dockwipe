# Usage

### Common

```bash
dockwipe --analyze
dockwipe --status
dockwipe --plan
dockwipe --safe
```

### Safe cleanup

```bash
dockwipe --plan
dockwipe --safe --yes
dockwipe --safe --older-than 7d --yes
dockwipe --safe --older-than 7d --prune-build-cache --yes
```

### Dry run

```bash
dockwipe --dry-run --safe --older-than 7d
dockwipe --dry-run --full
```

### Targeted cleanup

```bash
dockwipe --smart
dockwipe --containers
dockwipe --images
dockwipe --volumes
dockwipe --networks
dockwipe --cache
```

Use targeted cleanup manually only. The recommended dev-server automation command is `dockwipe --safe --yes`.

### Cron

Run safe cleanup every morning at 10 AM:

```cron
0 10 * * * /usr/local/bin/dockwipe --safe --yes >> /var/log/dockwipe/cleanup.log 2>&1
```

### Factory reset (destructive)

```bash
dockwipe --full
```
