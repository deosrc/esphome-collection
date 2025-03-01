# ESP32-S3-BOX-3

ESPHome base device configuration for the [Espressif ESP32-S3-BOX-3](https://www.espressif.com/en/news/ESP32-S3-BOX-3).

> :warning: This configuration uses ESPHome components from 3rd party repositories, or that have not yet merged into the main ESPHome project. Use with caution.

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/esp32-s3-box-3/main.yaml
```

## Peripherals

The ESP32-S3-BOX-3 has a number of peripheral modules which the device can be inserted into for additional
functionality. Where applicable, configurations for these are provided as separate files which can be
included as required:

```yaml
packages:
  device: !include _deosrc-collection/devices/esp32-s3-box-3/main.yaml
  sensor: !include _deosrc-collection/devices/esp32-s3-box-3/sensor.yaml
```
