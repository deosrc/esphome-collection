# ESPHome Devices Collection

This folder contains ESPHome base configurations for various devices. The can be
used as a building block for your ESPHome projects.

## Usage

All configurations are intended to be imported as packages. The configuration
can then be modified using the `!extend` tag.

```yaml
packages:
  device: !include _deosrc-collection/devices/sonoff-rf-bridge/main.yaml

binary_sensor:
  - id: !extend reset_button
    on_click:
      then:
        - # Custom configuration here...
```
