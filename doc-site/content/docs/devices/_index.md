---
title: Devices
date: 2025-01-20T22:28:37Z
description: Hardware configuration providing components which can be extended with custom functionality.
draft: true
menu:
  main:
---

## Usage

All configurations are intended to be imported as packages. The configuration can then be modified using the `!extend` tag.

```yaml
packages:
  device: !include _deosrc-collection/devices/sonoff-rf-bridge/main.yaml

binary_sensor:
  - id: !extend reset_button
    on_click:
      then:
        - # Custom configuration here...
```
