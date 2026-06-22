--▓▓▓▓  ▓▓▓▓▓  ▓▓▓   ▓▓▓  ▓▓▓▓   ▓▓▓  ▓▓▓▓▓ ▓▓▓  ▓▓▓  ▓   ▓   
--▓░░░▓ ▓░░░░░▓ ░░░ ▓ ░░▓ ▓░░░▓ ▓ ░░▓  ░▓░░░ ▓░░▓ ░░▓ ▓▓  ▓░  
--▓░░░▓░▓▓▓▓░░▓░ ░░░▓░ ░▓░▓▓▓▓░░▓▓▓▓▓░  ▓░░░░▓░░▓░ ░▓░▓░▓ ▓░░ 
--▓░░ ▓░▓░░░░ ▓░░   ▓░░ ▓░▓░░▓░ ▓░░░▓░░ ▓░░  ▓░░▓░░ ▓░▓░░▓▓░░ 
--▓▓▓▓ ░▓▓▓▓▓░ ▓▓▓   ▓▓▓ ░▓░░░▓░▓░░░▓░░ ▓░░ ▓▓▓░ ▓▓▓ ░▓░░ ▓░░ 
-- ░░░░ ░░░░░░  ░░░   ░░░ ░░░  ░ ░░  ░░  ░░  ░░░  ░░░ ░░░  ░░ 
--  ░░░░  ░░░░░  ░░░   ░░░  ░   ░ ░   ░   ░   ░░░  ░░░  ░   ░ 


local colors  = require("colors")

local gradient = { colors = {colors.surface_tint, colors.tertiary}, angle = 120  }

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = gradient,
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        allow_tearing = false,

    },

    decoration = {
        rounding = 4,
        rounding_power = 4,

        active_opacity   = 1.0,
        inactive_opacity = .65,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 7,
            passes    = 3,
            vibrancy  = 0.5,
            contrast  = 2,

            special   = true,
            new_optimizations = true,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Bezier Curves
hl.curve("easeInOutQuad",   { type = "bezier", points = { {0.45, 0},    {0.55, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 75.2633, dampening = 15.8273644 })
hl.curve("easyType2",      { type = "spring", mass = 1, stiffness = 90, dampening = 17.8})

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "quick" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 1.5,  spring = "easy", })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 1,    spring = "easy" , style = "popin 80%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1,    spring = "easy",  style = "popin 80%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.5, bezier = "easeInOutCubic" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.5, bezier = "easeInOutCubic" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 1.5, bezier = "easeInOutCubic" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 4.5,  bezier = "easeInOutQuad" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4.5,  bezier = "easeInOutQuad", style = "fade 20%" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 4.5,  bezier = "easeInOutQuad", style = "fade 50%" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = .5,   spring = "easyType2", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = .5,   spring = "easyType2", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = .5,   spring = "easyType2", style = "slide" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })
