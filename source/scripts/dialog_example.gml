if (de_dialog(sprNpcPortrait,"sndDJump",0.5,"Hello. What do you want??",true)) {
    if (de_choice("Sorry nothing")) {
        if (de_dialog(sprNpcPortrait,"sndDJump",0.5,"Well maybe you should stop wasting people's time like that.")) de_end()
    }
    if (de_choice("Who are you?")) {
        if (de_dialog(sprNpcPortrait,"sndDJump",0.5,"It's me your friend The Chap. Did you forget?")) {
            if (de_choice("Yes, i did forget")) {
                if (de_dialog(sprNpcPortrait,"sndDJump",0.5,"Damn,@@@@@@@@@@@@@@@@@ I can't believe you'd forget me that fast.@@@@@@#I'm hurt.")) {
                    if (de_runonce("shake")) camera_shake(10,50)
                    if (de_dialog(sprPlayerPortrait,"final5",4,"WHAT",false,true)) de_end()
                }
            }
            if (de_choice("I remember")) {
                if (de_dialog(sprNpcPortrait,"sndDJump",0.5,"Knew it. You would never forget your childhood friend.")) de_end()
            }
        }
    }
}
