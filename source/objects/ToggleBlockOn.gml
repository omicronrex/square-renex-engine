#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
ready=false
alarm[0]=5
killcheck=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=true
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (killcheck) {
    with (Player) if (instance_place(x,y,other.id)) kill_player()
    killcheck=false
}
#define Trigger_On Player Shoot
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready) {
    instance_create(x,y,ToggleBlockOff)
    instance_destroy()
}
