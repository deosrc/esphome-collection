"""Color mapping component"""

import esphome.config_validation as cv
import esphome.codegen as cg
from esphome.const import (
    CONF_ID,
    CONF_NAME,
    CONF_RED,
    CONF_GREEN,
    CONF_BLUE
)

CONF_COLORS = 'colors'
CONF_SELECTS = 'selects'

color_mapping_ns = cg.esphome_ns.namespace('color_mapping')
ColorMapping = color_mapping_ns.class_('ColorMapping', cg.Component)
TemplateSelect = cg.esphome_ns.namespace('template_').class_('TemplateSelect', cg.PollingComponent)

COLOR_SCHEMA = cv.Schema({
    cv.Required(CONF_NAME): cv.string,
    cv.Optional(CONF_RED): cv.percentage,
    cv.Optional(CONF_GREEN): cv.percentage,
    cv.Optional(CONF_BLUE): cv.percentage
})

CONFIG_SCHEMA = cv.Schema({
    cv.GenerateID(): cv.declare_id(ColorMapping),
    cv.Required(CONF_COLORS): cv.ensure_list(COLOR_SCHEMA),
    cv.Optional(CONF_SELECTS): cv.ensure_list(cv.use_id(TemplateSelect))
}).extend(cv.COMPONENT_SCHEMA)

async def to_code(config):
    var = cg.new_Pvariable(config[CONF_ID])
    await cg.register_component(var, config)

    # Build each color
    for c in config[CONF_COLORS]:
        red = c.get(CONF_RED, 0) * 255
        green = c.get(CONF_GREEN, 0) * 255
        blue = c.get(CONF_BLUE, 0) * 255
        cg.add(var.add_color(c[CONF_NAME], red, green, blue))

    # Add select option for each color
    color_list: list[str] = [c[CONF_NAME] for c in config[CONF_COLORS]]
    for s in config.get(CONF_SELECTS, []):
        select = await cg.get_variable(s)
        cg.add(select.traits.set_options(color_list))
