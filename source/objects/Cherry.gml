#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (global.use_original_cherries) image_speed=mmf_animspeed(20)*dt
else image_speed=1/15

destroy_outside=1
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (destroy_outside) instance_destroy()
