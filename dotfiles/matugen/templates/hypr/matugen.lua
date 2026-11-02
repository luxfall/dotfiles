local c = {
    primary = "rgb({{colors.primary.default.hex_stripped}})",
    on_primary = "rgb({{colors.on_primary.default.hex_stripped}})",
    primary_container = "rgb({{colors.primary_container.default.hex_stripped}})",
    on_primary_container = "rgb({{colors.on_primary_container.default.hex_stripped}})",
    secondary = "rgb({{colors.secondary.default.hex_stripped}})",
    on_secondary = "rgb({{colors.on_secondary.default.hex_stripped}})",
    secondary_container = "rgb({{colors.secondary_container.default.hex_stripped}})",
    on_secondary_container = "rgb({{colors.on_secondary_container.default.hex_stripped}})",
    tertiary = "rgb({{colors.tertiary.default.hex_stripped}})",
    tertiary_container = "rgb({{colors.tertiary_container.default.hex_stripped}})",
    error = "rgb({{colors.error.default.hex_stripped}})",
    error_container = "rgb({{colors.error_container.default.hex_stripped}})",
    success = "rgb({{colors.success.default.hex_stripped}})",
    warning = "rgb({{colors.warning.default.hex_stripped}})",
    warning_container = "rgb({{colors.warning_container.default.hex_stripped}})",
    background = "rgb({{colors.background.default.hex_stripped}})",
    on_background = "rgb({{colors.on_background.default.hex_stripped}})",
    surface = "rgb({{colors.surface.default.hex_stripped}})",
    surface_container_lowest = "rgb({{colors.surface_container_lowest.default.hex_stripped}})",
    surface_container_low = "rgb({{colors.surface_container_low.default.hex_stripped}})",
    surface_container = "rgb({{colors.surface_container.default.hex_stripped}})",
    surface_container_high = "rgb({{colors.surface_container_high.default.hex_stripped}})",
    surface_container_highest = "rgb({{colors.surface_container_highest.default.hex_stripped}})",
    on_surface = "rgb({{colors.on_surface.default.hex_stripped}})",
    on_surface_variant = "rgb({{colors.on_surface_variant.default.hex_stripped}})",
    outline = "rgb({{colors.outline.default.hex_stripped}})",
    outline_variant = "rgb({{colors.outline_variant.default.hex_stripped}})",
    inverse_surface = "rgb({{colors.inverse_surface.default.hex_stripped}})",
    inverse_on_surface = "rgb({{colors.inverse_on_surface.default.hex_stripped}})",
    inverse_primary = "rgb({{colors.inverse_primary.default.hex_stripped}})",
    shadow = "rgb({{colors.shadow.default.hex_stripped}})",
    scrim = "rgb({{colors.scrim.default.hex_stripped}})",
}

hl.config({
    general = {
        col = {
            active_border = { colors = { c.primary, c.secondary }, angle = 45 },
            inactive_border = "rgba({{colors.outline_variant.default.hex_stripped}}aa)",
            nogroup_border = "rgba({{colors.error_container.default.hex_stripped}}aa)",
            nogroup_border_active = c.error,
        },
    },
    decoration = {
        shadow = {
            color = "rgba({{colors.shadow.default.hex_stripped}}cc)",
            color_inactive = "rgba({{colors.shadow.default.hex_stripped}}77)",
        },
    },
    group = {
        col = {
            border_active = c.tertiary,
            border_inactive = "rgba({{colors.outline_variant.default.hex_stripped}}aa)",
            border_locked_active = c.warning,
            border_locked_inactive = "rgba({{colors.warning_container.default.hex_stripped}}aa)",
        },
        groupbar = {
            text_color = c.on_surface,
            col = {
                active = c.primary_container,
                inactive = c.surface_container_high,
                locked_active = c.warning_container,
                locked_inactive = c.surface_container,
            },
        },
    },
    misc = {
        background_color = c.surface_container_low,
    },
})

return c

