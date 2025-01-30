#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
ready=false
alarm[0]=5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ready=true
#define Trigger_On Player Shoot
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (ready) {
    instance_create(x,y,ToggleBlockOn)
    instance_destroy()
}
