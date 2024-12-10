//snap-in for sound mode

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_begin:{
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            sound_play_option("sndDJump")
            settings("stereomode",!settings("stereomode"))
        }
    }break
    case opt_text: {
        return "Sound Mode"
    }break
    case opt_value: {
        return pick(settings("stereomode"),"Mono","Stereo")
    }break
    case opt_end:{
    }break
}
