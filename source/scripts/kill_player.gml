if (!object_is_child_of(Player)) with (Player) kill_player()
else if (!dead) {
    if (room==global.difficulty_room) {
        if (global.diffroom_instantrestart) {
            Player.dead=1
            room_restart()
            exit
        }
    }

    if (global.debug_god) {
        if (!flashing) {
            flashing=room_speed
            sound_play_auto("sndBossHit")
            deathlist[1+deathlist[0]*2]=x
            deathlist[2+deathlist[0]*2]=y
            deathlist[0]+=1
        }
    } else {
        if (instance_exists(HPMode)) {
            if (!flashing) {
                HPMode.hp-=1
                flashing=HPMode.iframes
                sound_play_auto(HPMode.sound)
                emit_blood(10*settings("blood"))
            }
            if (HPMode.hp>0) exit
        }

        if (instance_exists(HitCount)) {
            if (!flashing) {
                HitCount.hits+=1
                flashing=HitCount.iframes
                sound_play_auto(HitCount.sound)
            }
        } else {
            trigger_broadcast(tr_playerdeath)

            if (global.gameover_music==0) {
                //jingle option
                if (global.restarting_music) {
                    if (instance_exists(MusicSync)) instance_destroy_id(MusicSync)
                    else sound_stop_music()

                    global.death_music_id=sound_play(global.death_music)
                } else {
                    if (instance_exists(MusicSync)) instance_destroy_id(MusicSync)
                    else if (global.music_instance) sound_pause(global.music_instance)

                    global.death_music_id=sound_play(global.death_music)
                }
            } else if (global.gameover_music==1) {
                //fade option
                sound_fade_music(0,100,1)
            } else if (global.gameover_music==2) {
                //pause option
                sound_fade_music(0,0,1)
            } else if (global.gameover_music==3) {
                //this is the "do nothing" option
            } else if (global.gameover_music==4) {
                //slowdown
                World.slowing=1
            }

            drop_items()

            vehicle_dismount()

            sound_play_auto("sndDeath")

            instance_create(x,y,BloodEmitter)
            instance_create(view_xcenter,view_ycenter,GameOver)

            with (FireballCherry) if (active) instance_destroy()

            Player.dead=true

            savedatap("deaths",savedatap("deaths")+1)
        }
    }
}
