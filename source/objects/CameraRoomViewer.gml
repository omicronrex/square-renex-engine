#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
spd=8
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(xstart,ystart,Player)) {
    if (key_up(vi_pressed) && !active) {
        sound_play_auto("sndButton")
        active=1
        lock_controls()
    } else if (key_shoot(vi_pressed) && active) {
        active=0
        unlock_controls()
        camera_follow(global.default_camera_follow)
    }
}

if (active) {
    camera_follow(id)
    if key_up() y-=spd
    if key_down() y+=spd
    if key_left() x-=spd
    if key_right() x+=spd
} else {
    x=view_xview+global.width/2
    y=view_yview+global.height/2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,xstart,ystart)
