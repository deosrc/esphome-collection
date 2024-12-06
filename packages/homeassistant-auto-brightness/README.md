# Home Assistant: Auto-brightness

Controls the brightness of components based on a Home Assistant sensor.

## Setup

Setup is dependent on the type of component which controls the brightness of the device.

### Light Component

For a device where the brightness is set using a light component:

```yaml
packages:
  auto_brightness: !include
    file: _deosrc-collection/packages/homeassistant-auto-brightness/light.yaml
    vars:
      control_component_id: backlight
      home_assistant_entity_id: sensor.kitchen_illuminance
      brightness_multiplier: "0.5"
```

### Number Component

For a device where the brightness is set using a number component. The number component should be configured using units of percent where 100 is max brightness.

```yaml
packages:
  auto_brightness: !include
    file: _deosrc-collection/packages/homeassistant-auto-brightness/number.yaml
    vars:
      control_component_id: brightness
      home_assistant_entity_id: sensor.kitchen_illuminance
      brightness_multiplier: "0.5"
```

An example number component for brightness control:

```yaml
number:
  - platform: template
    id: brightness
    name: Brightness
    icon: mdi:brightness-6
    optimistic: true
    entity_category: config
    mode: slider
    unit_of_measurement: '%'
    min_value: 50
    max_value: 100
    step: 5
    initial_value: 100
    restore_value: true
    on_value:
      then:
        - script.execute: update_all_indicators
```

## Parameters

- **control_component_id** (Required, string): The ID of the component which controls the display brightness (e.g. the ID of the light which controls the backlight.)
- **home_assistant_entity_id** (Required, string): The ID of the entity within Home Assistant to use for the brightness calculation.
- **offset** (Optional, integer): An amount to add (or subtract if negative) from the sensor value. This happens before the multiplier.
- **brightness_multiplier** (Optional, float): A multiplier to apply to the sensor value to determine the display brightness.
- **min_brightness** (Optional, integer): The minimum brightness in percent. Defaults to `10`.
