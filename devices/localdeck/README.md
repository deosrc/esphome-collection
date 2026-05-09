# Localdeck

ESPHome base device configuration for [LocalDeck](https://www.mylocalbytes.com/products/localdeck).

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/localdeck/main.yaml
```

### Light Segments & Buttons

By default, the keypad and lights are provided as a component each (one for the
keypad, one for the buttons). The `light_segments.yaml` and `buttons.yaml` packages
are available to provide individual components:

```yaml
packages:
  device: !include _deosrc-collection/devices/localdeck/main.yaml
  buttons: !include _deosrc-collection/devices/localdeck/buttons.yaml
  light_segments: !include _deosrc-collection/devices/localdeck/light_segments.yaml
```

Note that strange behaviour can occur if the LED strip component and the segments
components are controlled independently. For this reason, individual light components
are marked as internal.
