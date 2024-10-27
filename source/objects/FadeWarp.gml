#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
sprite_index=sprWarp
faderate=0.15
unfaderate=0.15
origin=room
fadestate=0
fadecol=0
alp=0
time_to_wait=0
w=global.width
h=global.height
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=roomTo && fadestate==0) {
    fadestate=1
    lock_controls()
    freeze_player()
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field faderate: number
//field unfaderate: number
//field fadecol: color
//field time_to_wait: number
event_inherited()

if (room!=roomTo && room!=origin) instance_destroy()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=roomTo && room!=origin) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=roomTo) draw_self()
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (fadestate==1) alp=approach(alp,1,faderate)
else if (fadestate==2) alp=approach(alp,0,unfaderate)

if (alp>0) {
    if (alp==1 && fadestate==1 && time_to_wait==0) {
        fadestate=2
        event_perform_object(Warp,ev_collision,Player)
    } else if (time_to_wait) time_to_wait-=1
    draw_set1(fadecol,alp)
    draw_rectangle(0,0,w,h,0)
    draw_reset()
} else if (fadestate==2) {
    unlock_controls()
    unfreeze_player()
    instance_destroy()
}
