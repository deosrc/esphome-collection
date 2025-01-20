---
title: Sonoff Rf Bridge
date: 2025-01-20T22:36:30Z
description: ESPHome base device configuration for Sonoff RF Bridge.
draft: true
---

{{< alert title="Warning" color="warning" >}}
There is a new version of this device. This configuration may not be compatible without modification.
{{< /alert >}}

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

## Complete Package: Doorbell

`doorbell.yaml` is intended as a complete package, to detect signals from 433MHz doorbells.

{{< alert color="info" >}}
The device and Last RF Received packages are included by the doorbell package, and do not need to be specified.
{{</ alert >}}

Example usage:

```yaml
esphome:
  name: sonoff-rf-bridge
  friendly_name: Sonoff RF Bridge

# Add wifi, api and other connection components

packages:
  doorbell: !include _deosrc-collection/devices/sonoff-rf-bridge/doorbell.yaml
```

When first deployed, the doorbell will need to be "Paired":

1. Press the reset button on the device, or turn the "Pairing Mode" switch component to On (e.g. via home assistant).
1. Press the doorbell button.

If successful, pairing mode should be switched off, and the Doorbell sensor components should be populated with values. If unsuccessful, pairing mode will remain on. In this case, it is likely that your doorbell is incompatible.

In addition to the "Doorbell Pressed" sensor component, the solution provide 3 button components:

- **Send Doorbell Press Signal:** Transmits the doorbell signal as if the doorbell button was pressed. This can be used to sound physical doorbell receivers. This can be useful for testing receivers, pranking others in the house, training dogs not to bark, etc.
- **Simulate Doorbell Signal Received:** Triggers the "Doorbell Pressed" component as if the doorbell had been pressed. This can be used for testing automations based on the doorbell in a more realistic way.
- **Simulate Doorbell Pressed:** Combines both buttons above to trigger both the "Doorbell Pressed" component and send the doorbell signal to physical receivers.
