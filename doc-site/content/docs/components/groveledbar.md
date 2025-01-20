---
title: Grove LED Bar
date: 2025-01-20T22:40:52Z
description: ESPHome external component for the [Grove LED Bar](https://thepihut.com/products/grove-led-bar-v2-0).
draft: true
---

{{< alert title="Experimental" color="warning" >}}
The chips controlling this component has known issues with timing. This implementation is also developed as far as needed for a "good enough" use case.

**Expect issues when using**
{{</ alert >}}

## Usage

```yaml
display:
  - platform: groveledbar
    clk_pin: GPIO18
    dio_pin: GPIO19
    update_interval: 0.05s
    lambda: |-
      // Lambda display code here...
```

### Lambda Methods

- `set_on(bool)`: Turns the LED Bar on or off.
- `set_led(uint8_t, bool)`: Sets a single LED either on or off. Has no effect if `set_on(false)`.
