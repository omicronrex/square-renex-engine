///player_land(vspeed)
landvspeed=argument0

walljumpboost=0
djump=1
coyoteTime=global.coyote_time

if (onfire) kill_player()

with (JumpRefresher) active=1

//jump buffering checks
if (jump_timer && key[key_jump]) {
    player_jump()
    //this correction is necessary to avoid making 4.5s too easy
    vspeed+=gravity
}
