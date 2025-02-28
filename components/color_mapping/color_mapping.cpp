#include "color_mapping.h"
#include "esphome/core/color.h"
#include "esphome/core/log.h"

static const char *const TAG = "color_mapping";

void esphome::color_mapping::ColorMapping::add_color(std::string name, uint8_t red, uint8_t green, uint8_t blue)
{
  colors_[name] = esphome::Color(red, green, blue);
}

esphome::Color esphome::color_mapping::ColorMapping::name_to_color(std::string name)
{
  ColorMap::const_iterator pos = colors_.find(name);
  if (pos == colors_.end()) {
    ESP_LOGE(TAG, "Could not convert color '%s' so using default", name);
    return esphome::Color::BLACK;
  } else {
    return pos->second;
  }
}
