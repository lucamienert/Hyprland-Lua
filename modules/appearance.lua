hl.config({
    general = {
        gaps_in          = 6,
        gaps_out         = 12,
        border_size      = 2,
        col = {
            active_border   = "rgba(8ab4f8ff",
            inactive_border = "rgba(666666aa)",
        },
        resize_on_border = true,
        allow_tearing    = true,
        layout           = "dwindle",
    },

    decoration = {
        rounding         = 18,
        active_opacity   = 0.92,
        inactive_opacity = 0.9,
        dim_inactive     = false,
        dim_strength     = 0.25,

        shadow = {
            enabled      = true,
            range        = 20,
            render_power = 4,
            color        = "rgba(00000055)",
        },

        blur = {
            enabled  = true,
            size     = 10,
            passes   = 3,
            vibrancy = 0.3,
            vibrancy_darkness = 0.1,
        },
    },

    xwayland = {
        force_zero_scaling = true,
    },
})
