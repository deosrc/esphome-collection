# Localdeck

ESPHome base device configuration for [LocalDeck](https://www.mylocalbytes.com/products/localdeck).

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/localdeck/main.yaml
```

### Light Segments

By default, button lights are provided as a single component. The `light_segments.yaml`
package is provided which expands the LED strip to individual components:

```yaml
packages:
  device: !include _deosrc-collection/devices/localdeck/main.yaml
  light_segments: !include _deosrc-collection/devices/localdeck/light_segments.yaml
```

By default, all components are marked as internal.

Note that strange behaviour can occur if the LED strip component and the segments
components are controlled independently.
