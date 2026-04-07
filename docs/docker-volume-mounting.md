## Docker volume mounting

Bonjour expects the configuration directory to be mounted at `/app/config` inside the container.

### Recommended setup

```yaml
services:
  bonjour:
    container_name: bonjour
    image: ghcr.io/dishine-digital-agency/bonjour
    volumes:
      - ./config:/app/config
    ports:
      - 8080:8080
```

With the following directory structure:

```plaintext
bonjour/
    docker-compose.yml
    config/
        bonjour.yml
```

### Why a directory instead of a single file?

1. Mounting a directory rather than a single file avoids common Docker issues such as creating a directory if the file is not present
2. Automatic config reloads work reliably when monitoring a directory
3. The [include](configuration.md#including-other-config-files) feature lets you split configuration across multiple files in the same directory
