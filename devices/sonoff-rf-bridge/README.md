# Sonoff RF Bridge

ESPHome base device configuration for Sonoff RF Bridge.

> :warning: There is a new version of this device. This configuration may not be compatible without modification.

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/sonoff-rf-bridge/main.yaml
```

## Extended Usage: Last RF Received

The `last-rf-received.yaml` package is provided as an ease-of-use package. Including this package will add sensor components for received RF signal codes. This package must be included **in addition to** the device package.

```yaml
packages:
  device: !include _deosrc-collection/devices/sonoff-rf-bridge/main.yaml
  last_rf_received: !include _deosrc-collection/devices/sonoff-rf-bridge/last-rf-received.yaml
```

When using this package, implementing `on_code_received` will prevent the components from updating. In order to restore functionality, you will need to call the `update_last_rf_received` script in your implementation:

```yaml

rf_bridge:
  on_code_received:
    then:
      - script.execute:
          id: update_last_rf_received
          sync: !lambda return format_hex(data.sync);
          low: !lambda return format_hex(data.low);
          high: !lambda return format_hex(data.high);
          code: !lambda return format_hex(data.code);
      - # Your implementation here...
```
