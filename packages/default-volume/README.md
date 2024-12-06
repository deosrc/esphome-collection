# Default Volume

Sets a media player volume to a configurable default on startup.

## Usage

```yaml
packages:
  default_volume: !include
    file: _deosrc-collection/packages/default-volume/main.yaml
    vars:
      initial_value: "50"
```
