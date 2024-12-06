# Volume Overlay

Draws a volume indicator on a display screen.

## Usage

The basic usage provides a vertical volume indicator on a display. The indicator color theme can be customized.

In order to function, a sensor containing the current volume is required. The package is then configured for this sensor and a given screen:

```yaml
packages:
  volume_overlay: !include
    file: _deosrc-collection/packages/volume-overlay/main.yaml
    vars:
      screen_id: screen
      volume_sensor_id: volume
```

The overlay script must also be called when updating the screen:

```yaml
- script.execute: draw_volume_overlay
```

## Extended Usage: Timer

A typical use case would be to display the overlay when the volume is adjusted via a rotary control or buttons, in order to provide feedback to a user. To aid in this, an additional `timer.yaml` package is provided, which will display the overlay for a few seconds. This must be used **in addition to** the `main.yaml` package:

```yaml
packages:
  volume_overlay: !include
    file: _deosrc-collection/packages/volume-overlay/main.yaml
    vars:
      screen_id: screen
      media_player_id: player
  volume_overlay_timer: !include _deosrc-collection/packages/volume-overlay/timer.yaml
```

The call to display the overlay when updating the display also changes:

```yaml
- script.execute: draw_volume_overlay_if_required
```

You will also need to trigger the overlay when the volume control is adjusted:

```yaml
- script.execute: trigger_volume_overlay
```
