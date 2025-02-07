#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///instructions & init

/*
    Gizmos are the general parent for any object that will react to triggers.
    They will receive a Trap is Triggered event whenever a triggerbomb detonates on them.

    look in custom_traps() for more information.
*/

dir=0
spd=0
hsp=0
vsp=0
grav=0
grav_dir=noone
path=noone
path_endaction=path_action_stop
path_speed=0
path_absolute=true
path_scaling=1
path_xstart=x
path_ystart=y
sound=""

scaleh=0
scalev=0
scaling=0

rotate=0
rotating=0

no_destroy_outside=0
trigger_on_create=0

trap_redir_index=0
trap_stop_index=0
trap_destroy_index=0

move_to_xy[0]=noone
move_to_xy[1]=noone
move_spd=1
move_time=0
move_t=0
move_relative=0
move_easing="EaseLinear"

move_to_xy_grav[0]=noone
move_to_xy_grav[1]=noone
move_grav=0

execute_code=""
execute_code_timer=0
execute_code_t=0
executed=0

trap_delay=0

trg=0

variables_defined=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!trg) exit
else if (trap_delay) {
    trap_delay-=1
    if (trap_delay<=0) event_trigger(tr_traptriggered)
    exit
}

if (scaling) {
    sw=sprite_get_width(sprite_index)
    sh=sprite_get_height(sprite_index)

    if (scaleh>0) {image_xscale+=scaleh/sw x+=scaleh*(sprite_xoffset/sw/image_xscale)}
    if (scalev>0) {image_yscale+=scalev/sh y+=scalev*(sprite_yoffset/sh/image_yscale)}

    if (scaleh<0) {image_xscale+=-scaleh/sw x+=scaleh*(1-sprite_xoffset/sw/image_xscale)}
    if (scalev<0) {image_yscale+=-scalev/sh y+=scalev*(1-sprite_yoffset/sh/image_yscale)}
}

if (rotating) {
    image_angle+=rotate
}

if (execute_code!="") {
    if (execute_code_timer==0) {
        if (!executed) {executed=1 execute_string(execute_code)}
    } else if (execute_code_t mod execute_code_timer==0) execute_string(execute_code)
    execute_code_t+=1
}

if (move_to_xy[0]!=noone && move_to_xy[1]!=noone && move_spd!=0 && trg) {
    move_t=approach(move_t,move_time,1)
    if (!move_relative) {
        x=ease(move_t,0,move_time,xstart,move_to_xy[0],move_easing)
        y=ease(move_t,0,move_time,ystart,move_to_xy[1],move_easing)
    } else {
        x=ease(move_t,0,move_time,xstart,xstart+move_to_xy[0],move_easing)
        y=ease(move_t,0,move_time,ystart,ystart+move_to_xy[1],move_easing)
    }
}

if (move_to_xy_grav[0]!=noone && move_to_xy_grav[1]!=noone && move_grav>0) {
    if (point_distance(x,y,move_to_xy_grav[0],move_to_xy_grav[1])<=speed) {
        x=move_to_xy_grav[0]
        y=move_to_xy_grav[1]
        hspeed=0
        vspeed=0
        gravity=0
    }
}

var coll;coll=noone
coll=instance_place(x+hspeed,y+vspeed,TrapStop)

if (coll) if (trap_stop_index==coll.index) {
    x+=hspeed y+=vspeed
    if (hspeed>0) repeat (ceil( hspeed)) {x-=1 if (!instance_place(x,y,coll)) break}
    if (hspeed<0) repeat (ceil(-hspeed)) {x+=1 if (!instance_place(x,y,coll)) break}
    if (vspeed>0) repeat (ceil( vspeed)) {y-=1 if (!instance_place(x,y,coll)) break}
    if (vspeed<0) repeat (ceil(-vspeed)) {y+=1 if (!instance_place(x,y,coll)) break}

    speed=0

    if (scaling) {
        sw=sprite_get_width(sprite_index)
        sh=sprite_get_height(sprite_index)

        if (scaleh>0) repeat (ceil( scaleh)) {x-=1*(  sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,coll)) break}
        if (scalev>0) repeat (ceil( scalev)) {y-=1*(  sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,coll)) break}
        if (scaleh<0) repeat (ceil(-scaleh)) {x-=-1*(1-sprite_xoffset/sw/image_xscale) image_xscale-=1/sw if (!instance_place(x,y,coll)) break}
        if (scalev<0) repeat (ceil(-scalev)) {y-=-1*(1-sprite_yoffset/sh/image_yscale) image_yscale-=1/sh if (!instance_place(x,y,coll)) break}

        scaling=false
    }

    if (rotating) {
        image_angle-=rotate
        rotating=false
    }
}

coll=instance_place(x+hspeed,y+vspeed,TrapRedirect)

if (coll) if (trap_redir_index==coll.index) {
    x+=hspeed y+=vspeed
    if (hspeed>0) repeat (ceil( hspeed)) {x-=1 if (!instance_place(x,y,coll)) break}
    if (hspeed<0) repeat (ceil(-hspeed)) {x+=1 if (!instance_place(x,y,coll)) break}
    if (vspeed>0) repeat (ceil( vspeed)) {y-=1 if (!instance_place(x,y,coll)) break}
    if (vspeed<0) repeat (ceil(-vspeed)) {y+=1 if (!instance_place(x,y,coll)) break}

    gravity=coll.grav
    if (coll.hsp==0 && coll.vsp==0 && coll.spd==0 && coll.dir==0) {
        hspeed*=-1
        vspeed*=-1
    } else if (coll.spd==0 && coll.dir==0) {
        hspeed=coll.hsp
        vspeed=coll.vsp
    } else if (coll.hsp==0 && coll.vsp==0) {
        speed=coll.spd
        direction=coll.dir
    } else {
        speed=coll.spd
        direction=coll.dir
        hspeed+=coll.hsp
        vspeed+=coll.vsp
    }
}

coll=instance_place(x+hspeed,y+vspeed,TrapDestroy)

if (coll) if (trap_destroy_index==coll.index) instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!no_destroy_outside && trg) {
    if (x>room_width and hspeed>0)
    or (x<0 and hspeed<0)
    or (y>room_height and vspeed>0)
    or (y<0 and vspeed<0) {
        instance_destroy()
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fields definition

//field depth: number
//field sound: string
//field movement: false
    //field dir: angle
    //field spd: number
    //field hsp: number
    //field vsp: number
    //field grav: number
        //field grav_dir: angle
//field scaling_rotation: false
    //field scaleh: number
    //field scalev: number
    //field rotate: number
//field advanced_movement: false
    //field path: path
        //field path_endaction: enum(path_action_continue,path_action_restart,path_action_reverse,path_action_stop)
        //field path_absolute: true
        //field path_scaling: number
        //field path_speed: number
    //field move_to_xy: xy
        //field move_spd: number
        //field move_relative: false
        //field move_easing: enum("EaseLinear","EaseInSine","EaseOutSine","EaseInOutSine","EaseInQuad","EaseOutQuad","EaseInOutQuad","EaseInCubic","EaseOutCubic","EaseInOutCubic","EaseInQuart","EaseOutQuart","EaseInOutQuart","EaseInQuint","EaseOutQuint","EaseInOutQuint","EaseInCirc","EaseOutCirc","EaseInOutCirc","EaseInBack","EaseOutBack","EaseInOutBack")
    //field move_to_xy_grav: xy
        //field move_grav: number
//field control: false
    //field no_destroy_outside: false
    //field trigger_on_create: false
    //field trap_delay: number
    //field trap_redir_index: number
    //field trap_stop_index: number
    //field trap_destroy_index: number
    //field execute_code: string
        //field         execute_code_timer: number - (0=once, 1=every frame, 2=every 2 frames, etc)

if (!variable_local_exists("variables_defined")) {
    show_error("Error in instance "+string(id)+" of object "+object_get_name(object_index)+": Gizmo parent variables are not defined. Please use event_inherited()/Call Event on your object's Create event to correctly set up "+object_get_name(object_get_parent(object_index))+" inheritance.",1)
    exit
}

if (move_to_xy[0]!=noone && move_to_xy[1]!=noone && move_spd) {
    move_time=round_unbiased(point_distance(xstart,ystart,move_to_xy[0],move_to_xy[1])/move_spd)
    move_time=max(move_time,1)
}

if (trigger_on_create) event_trigger(tr_traptriggered)
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_position>1) {
    path_position=0
    x=path_get_x(path_index,path_position)
    y=path_get_y(path_index,path_position)
    if (!path_absolute) {
        x+=path_xstart
        y+=path_ystart
    }
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///get movin'

trg=1

if (trap_delay>0) exit

move_t=0

if (sound!="") sound_play_auto(sound)

if (path!=noone) {
    path_start(path,path_speed,path_endaction,path_absolute)
    path_scale=path_scaling
    path_xstart=x
    path_ystart=y
} else {
    speed=spd
    direction=dir
    hspeed+=hsp
    vspeed+=vsp
}

if (scaleh!=0 || scalev!=0) {
    scaling=1
}

if (rotate!=0) {
    rotating=1
}

if (grav!=0) {
    gravity=grav
}

if (grav_dir!=noone) {
    gravity_direction=grav_dir
}


if (move_to_xy_grav[0]!=noone && move_to_xy_grav[1]!=noone && move_grav>0) {
    move_towards_gravity(move_to_xy_grav[0],move_to_xy_grav[1],move_grav)
    vspeed-=gravity/2
}
