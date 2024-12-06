if (settings("fullscreen")) {
    var s;s=min(global.dw/global.width,global.dh/global.height)
    return floor(view_xview+((display_mouse_get_x()-global.woffset)/s))
} else {
    return mouse_x
}
