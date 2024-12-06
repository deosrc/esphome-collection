# Color Mapping

An ESPHome component for mapping color names to [Color objects](https://esphome.io/api/structesphome_1_1_color.html).

## Usage

To define a mapping:

```yaml
color_mapping:
  id: color_map
  colors:
    - name: White
      red: 100%
      green: 100%
      blue: 100%
    - name: Red
      red: 100%
    - name: Green
      green: 100%
    - name: Blue
      blue: 100%
    # ...
```

To use in a lambda:

```cpp
// Get color name from select
auto playerColor = id(position_se_color).state;

// Convert to color object
auto color = id(color_map).name_to_color(playerColor);
```

## Use with Select components

A typical use case would be to have a select component with a list of colors. A lambda expression then uses the selection to set an LED. To avoid needing a list of colors in multiple places, the component can automatically populate the select components.

1. Define the select. You will need to provide at least one option, but this will be removed when the select is updated by the color mapping. If you are specifying an initial value, you will need to ensure it is present in the options list so that validation will pass. You should also manually check that it is present in the color mapping:

    ```yaml
    select:
      - platform: template
        name: "Position Color"
        id: position_color
        icon: mdi:account-circle
        optimistic: true
        initial_option: Blue
        options:
          - Blue # Will be replaced by color_mapping component, but required for validation.
    ```

1. The ID of the select is then added to the color mapping definition:

    ```yaml
    color_mapping:
      id: color_map
      select:
        - position_color
      colors:
        - name: White
          red: 100%
          green: 100%
          blue: 100%
        - name: Red
          red: 100%
        - name: Green
          green: 100%
        - name: Blue
          blue: 100%
        # ...
    ```

The select component should contain all of (and only) the defined colors, regardless of the options on the select component.
