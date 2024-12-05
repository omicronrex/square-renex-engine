//snap-in for fullscreen filtering

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("bloodcoll",modwrap(settings("bloodcoll")+h,0,3))
        }
    }break
    case opt_text: {
        return "Blood Collision"
    }break
    case opt_value: {
        return pick(settings("bloodcoll"),"All","Blocks","None")
    }break
    case opt_end:{
    }break
}
