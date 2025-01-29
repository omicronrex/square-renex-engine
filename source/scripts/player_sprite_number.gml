///player_sprite_number(sprite)

if (settings("anim")) {
    switch (argument[0]) {
        case spr_idle:      return 4
        case spr_run:       return 6
        case spr_jump:      return 4
        case spr_fall:      return 4
        case spr_slide:     return 2
        case spr_climb:     return 2
        case spr_climbup:   return 4
        case spr_climbside: return 2
        case spr_taunt:     return 1
    }
} else {
    switch (argument[0]) {
        case spr_idle:      return 4
        case spr_run:       return 4
        case spr_jump:      return 2
        case spr_fall:      return 2
        case spr_slide:     return 2
        case spr_climb:     return 2
        case spr_climbup:   return 4
        case spr_climbside: return 2
        case spr_taunt:     return 1
    }
}

return 1
