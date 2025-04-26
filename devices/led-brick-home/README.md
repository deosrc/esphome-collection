# LED Brick Home

ESPHome base device configuration for [LED Brick Home](https://xelaser.co.uk/product/ledbrickhome-16-channel-version/).

## Usage

See [Devices README](../README.md).

```yaml
packages:
  device: !include _deosrc-collection/devices/led-brick-home/main.yaml
  single_channels: !include _deosrc-collection/devices/led-brick-home/single-channels.yaml
```

### Single Channels Package

The device is designed with multiple uses for the GPIO pins. For example, the
GPIO pins connecting to ports 1, 2 and 3 on the device, are also used for the
RGB1 port. This means you can either use ports 1, 2 and 3; or the RGB1 port.
You cannot use them both together.

Single channel LEDs are more common, so the `single-channels.yaml` package has
been provided. This defines light components for all of the single-channel ports.
They are all disabled by default. It is recommended to extend each channel
as required and customise it appropriately:

```yaml
light:
  - id: !extend light_channel_1
    name: Concorde Nav Lights
    icon: mdi:car-parking-lights
    disabled_by_default: false
```

If you wish to use any of the RGB ports, do not use the `single-channels.yaml` package.
Instead, define the light components manually:

```yaml
light:
  - id: rgb1
    platform: rgb
    name: RGB1
    red: output_channel_1
    green: output_channel_2
    blue: output_channel_3
  - id: mc4
    platform: monochromatic
    name: Channel 4
    output: output_channel4
```
