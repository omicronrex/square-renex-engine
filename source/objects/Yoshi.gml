#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vflip=sign(image_yscale)

vspeed=-1.5*vflip
gravity=0.3*vflip

dead=0
lost=0
angle=0

onPlatform=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (lost) {
    //spent yoshi
    sprite_index=sprYoshiLost
    image_speed=1/25
    hspeed=0
} else if (dead) {
    //dead yoshi
    sprite_index=sprYoshiDead
    hspeed=0

    if (bleeding) {
        bleeding-=1
        y-=20+20*vflip
        x+=10*image_xscale
        emit_prop_blood(10*settings("blood"))
        y+=20+20*vflip
        x-=10*image_xscale
    }

    if (!place_free(x,y+vspeed)) {
        move_contact_solid(point_direction(0,0,0,gravity),abs(vspeed))
        gravity=0
        vspeed=0
    } else {
        gravity=0.4*vflip
    }

    angle=max(-20,angle-0.5)
} else if (active) {
    //yoshi is being ridden

    gravity=0.4*vflip

    hspeed=macro_leftright()*4
    vspeed=min(vspeed,11)

    image_xscale=esign(hspeed,image_xscale)

    image_speed=1/25
    if (abs(vspeed)>abs(gravity)) {
        sprite_index=sprYoshiJump
        image_index=vspeed*vflip>0
    } else if (hspeed!=0) {
        sprite_index=sprYoshiRunning
        image_speed=0.5
    } else sprite_index=sprYoshiStand

    if (key_jump(vi_pressed)) {
        if (instance_place(x,y+vflip,Block)) {
            if (passenger.vvvvvv) {
                vflip=-vflip
                if (vflip==-1) sound_play_auto("sndVFlip1")
                else sound_play_auto("sndVFlip2")
            } else vspeed=-11*vflip
            passenger.vflip=vflip
        }
    }
    if (key_jump(vi_released)) {
        if (vspeed*vflip<0) vspeed*=0.45
    }

    if (key_shoot(vi_pressed)) {
        //kill yoshi
        sound_play_auto("sndShoot")
        sound_play_auto("sndDeath")

        vehicle_dismount()
        passenger.y-=20*vflip
        with (passenger) if (object_is_child_of(Player)) {
            if (vvvvvv) {
                flip_player()
                vspeed=maxVspeed*vflip
                sound_play_auto("sndVLineFlip")
            } else vspeed=other.vspeed
        }
        vspeed=0

        dead=1
        bleeding=10*settings("blood")
    }

    if (passenger.vvvvvv) {
        if (vflip== 1 && vspeed!=0) vspeed= 11
        if (vflip==-1 && vspeed!=0) vspeed=-11
    }

    var land,store_y,was_on_slope,is_going_into_slope,grav_step;

    land=0
    was_on_slope=0
    is_going_into_slope=0
    grav_step=gravity
    if (gravity==0) grav_step=0.5

    if (esign(vspeed+gravity,vflip)==vflip) {
        was_on_slope=instance_place(x,y+2*vflip,SlopeParent)
        //optimization: short circuit
        if (!was_on_slope) is_going_into_slope=instance_place(x+hspeed,y+2*vflip,SlopeParent)
        if (was_on_slope || is_going_into_slope) {
            x+=hspeed
            if (place_free(x,y)) {
                if (was_on_slope) if (instance_place(x,y+8*vflip,Block)) {
                    //land on slope or blocks moving down
                    move_contact_solid(180+90*vflip,8*vflip)
                    //optimization: only check collision once it crosses pixel boundary
                    while (place_free(x,y+grav_step)) {store_y=round(y) do y+=grav_step until round(y)!=store_y} y-=grav_step
                    land=1
                }
            } else {
                //move up out of ground when walking up slope
                store_y=y
                move_outside_solid(180-90*vflip,6)
                if (!place_free(x,y)) {
                    //couldn't move out, so it's probably a wall
                    //move back down
                    y=store_y
                } else {
                    //land on slope or blocks moving up
                    y-=grav_step
                    land=1
                }
            }
            x-=hspeed
        }
    }

    if (land) {
        vspeed=0
    }

    vspeed+=gravity

    if (!place_free(x+hspeed,y+vspeed)) {
        if (!place_free(x+hspeed,y)) {
            a=ceil(abs(hspeed))
            s=sign(hspeed)
            repeat (a) {
                x+=s
                if (!place_free(x,y)) {x-=s hspeed=0 break}
            }
            x-=hspeed
        }

        if (!place_free(x,y+vspeed)) {
            a=ceil(abs(vspeed))
            s=sign(vspeed)

            vspeed=0

            repeat (a) {
                y+=s
                if (!place_free(x,y)) {
                    y-=s
                    break
                }
            }
        }
        if (!place_free(x+hspeed,y+vspeed)) {
            if (onPlatform) vspeed=0
            else hspeed=0
        }
    }

    vspeed-=gravity
} else {
    sprite_index=sprYoshiWait
    image_speed=1/25
    //idle yoshi routine
    if (instance_place(x,y+vspeed,Block)) {
        move_contact_solid(point_direction(0,0,0,gravity),abs(vspeed))
        vspeed=-1.5*vflip
    }

    image_xscale=esign(Player.x-x,image_xscale)
}
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///yoshi mount condition

if (!other.dotkid && other.vflip==vflip && other.vspeed*other.vflip>0 && !dead && !lost) {
    vehicle_mount()
}
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (other.object_index=SmwSaw) {
        if (y<=other.y-2) {
            sound_play_auto("sndYoshiJump")
            if (key_jump())
                vspeed=-15
            else
                vspeed=-5
            exit
        }
    }

    sound_play_auto("sndYoshi2")

    passenger.vspeed=vspeed

    with (passenger) if (vvvvvv) {
        flip_player()
        vspeed=maxVspeed*vflip
        sound_play_auto("sndVLineFlip")
    }

    lost=1
    vspeed=-8*vflip
    gravity=0.2*vflip

    vehicle_dismount()

    passenger.y -= 20
    passenger.iframes = 25
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) if (passenger.vvvvvv) d3d_set_fog(1,$d9a401,0,0)
draw_sprite_ext(sprite_index,floor(image_index),x,y-16+16*vflip,image_xscale,vflip,angle,image_blend,image_alpha)
if (active) if (passenger.vvvvvv) d3d_set_fog(0,0,0,0)
#define Trigger_Vehicle Mount
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play_auto("sndYoshi")
