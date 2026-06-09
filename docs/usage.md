# Usage

### Common

```bash
dockwipe analyze
dockwipe status
dockwipe plan
dockwipe clean
```

### Safe cleanup

```bash
dockwipe plan
dockwipe clean --yes
```

### Dry run

```bash
dockwipe --dry-run clean
dockwipe --dry-run danger full
```

### Danger commands

```bash
dockwipe danger help
dockwipe danger smart
dockwipe danger containers
dockwipe danger images
dockwipe danger volumes
dockwipe danger networks
dockwipe danger cache
dockwipe danger full
```

Danger commands require an exact confirmation phrase and ignore `--yes`.

### Cron

Run safe cleanup every morning at 10 AM:

```cron
0 10 * * * /usr/local/bin/dockwipe clean --yes >> /var/log/dockwipe/cleanup.log 2>&1
```
