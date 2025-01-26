#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!sound_isplaying(sound)) {
    instance_destroy()
    exit
}

if (instance_exists(owner)) {
    x=owner.x
    y=owner.y
    hspeed=owner.hspeed
    vspeed=owner.vspeed
}

if (instance_exists(Player)) {
    xcenter=Player.x
    ycenter=Player.y
} else {
    xcenter=view_xview+view_wview/2
    ycenter=view_yview+view_hview/2
}

sound_pan(sound,median(-1,(x-(xcenter))/view_wview,1))
sound_volume(sound,min(1,1+((view_wview*2/3)-point_distance(x,y,xcenter,ycenter))/(view_wview*2/3)))
