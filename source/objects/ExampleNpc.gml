#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
notice=0
image_speed=0.2

de_settings()

keyname=script_execute(de_input_advance,vi_name)
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
notice=!cutscene

if (key_shoot(vi_pressed)) de_begin(dialog_example)
#define Trigger_Draw End
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (notice) draw_sign_text(mean(bbox_left,bbox_right),bbox_top-10,fntSignpost,$ffffff,keyname+lang("presstotalk"),false)
notice=false
