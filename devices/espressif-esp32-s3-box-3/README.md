# ESP32-S3-BOX-3

ESPHome device configuration for the [Espressif ESP32-S3-BOX-3](https://www.espressif.com/en/news/ESP32-S3-BOX-3).

> :warning: **Use with caution.**
>
> This configuration uses ESPHome components that have not yet merged into the
> main ESPHome project.

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/esp32-s3-box-3/main.yaml
```

## Peripherals

The ESP32-S3-BOX-3 has a number of peripheral modules which the device can be
inserted into for additional functionality. Where applicable, configurations
for these are provided as separate files which can be included as required:

```yaml
packages:
  device: !include _deosrc-collection/devices/esp32-s3-box-3/main.yaml
  sensor: !include _deosrc-collection/devices/esp32-s3-box-3/sensor.yaml
```
