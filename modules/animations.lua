hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("minimal", {
    type = "bezier",
    points = {
        { 0.25, 0.1 },
        { 0.25, 1.0 },
    },
})

hl.curve("smooth", {
    type = "bezier",
    points = {
        { 0.4, 0.0 },
        { 0.2, 1.0 },
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 4,
    bezier = "minimal",
    style = "slide",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "minimal",
    style = "slide",
})

hl.animation({
    leaf = "windowsMove",
    enabled = true,
    speed = 4,
    bezier = "minimal",
    style = "slide",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 6,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "smooth",
    style = "slidevert",
})

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 5,
    bezier = "smooth",
    style = "slidevert",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 5,
    bezier = "minimal",
})

hl.animation({
    leaf = "fadeIn",
    enabled = true,
    speed = 5,
    bezier = "minimal",
})

hl.animation({
    leaf = "fadeOut",
    enabled = true,
    speed = 5,
    bezier = "minimal",
})
