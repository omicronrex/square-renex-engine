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
    var w,h;
    w=global.width/2
    h=global.height/2
    x=clamp(x,0+w,room_width-w)
    y=clamp(y,0+h,room_height-h)
} else {
    x=view_xview+global.width/2
    y=view_yview+global.height/2
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
    Allows the player to see the whole room.
    You can adjust the speed they move at with the spd variable.
*/

//field spd: number
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,xstart,ystart)
