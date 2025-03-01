# Adafruit Magtag

ESPHome base device configuration for [Adafruit Magtag](https://www.adafruit.com/magtag).

## Component Support

- [x] Buttons
- [x] Status LED (Red LED on rear)
- [x] Neopixel LEDs
- [x] Screen
- [x] Light Sensor
- [x] Speaker
- [ ] Battery Voltage Sensor
- [ ] Accelerometer
  - Not currently supported by ESPHome ([Issue](https://github.com/esphome/feature-requests/issues/5))

Note that any attachments to the STEMMA ports will need additional configuration based on the attached peripheral.

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/adafruit-magtag/main.yaml
```
