#pragma once

#include <map>
#include "esphome/core/component.h"
#include "esphome/core/color.h"

namespace esphome {
namespace color_mapping {

typedef std::map<std::string, esphome::Color> ColorMap;

class ColorMapping : public Component {
  protected:
    ColorMap colors_;
  public:
    void add_color(std::string name, uint8_t red, uint8_t green, uint8_t blue);
    esphome::Color name_to_color(std::string name);
};

}
}
