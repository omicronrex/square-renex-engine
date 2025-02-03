//snap-in for sound pause

switch (argument0) {
    case opt_inpause: {
        return true
    }break
    case opt_step:{
        h=key_jump(vi_pressed)+macro_leftright(vi_pressed)
        if (h!=0) {
            //option ticked/changed
            sound_play_option("sndDJump")
            settings("pause sounds",!settings("pause sounds"))
            if (object_index==PauseMenu) {
                if (settings("pause sounds")) sound_pause_all() else sound_resume_all()
            }
        }
    }break
    case opt_text: {
        return "Pause Sounds with Game"
    }break
    case opt_value: {
        return pick(settings("pause sounds"),"No","Yes")
    }break
    case opt_end:{
    }break
}
