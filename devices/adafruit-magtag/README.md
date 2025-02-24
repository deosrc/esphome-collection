# Adafruit Magtag

ESPHome base device configuration for [Adafruit Magtag](https://www.adafruit.com/magtag).

## Component Support

- [x] Buttons
- [x] Status LED (Red LED on rear)
- [x] Neopixel LEDs
- [x] Screen
- [x] Light Sensor (requires LED power switch to be on)
- [ ] Speaker (works but only in IDF which then breaks LEDs)
- [ ] Accelerometer

Note that any attachments to the STEMMA ports will need additional configuration based on the attached peripheral.

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/adafruit-magtag/main.yaml
```
