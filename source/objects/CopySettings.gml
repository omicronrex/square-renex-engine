#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.disable_settings_repo) {
    instance_destroy()
} else if (!file_exists(global.setrepo)) instance_destroy()

sel=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_goto_next()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (key_left(vi_pressed)) {
    sound_play("sndJump")
    sel=0
}
if (key_right(vi_pressed)) {
    sound_play("sndJump")
    sel=1
}

if (key_jump(vi_pressed)) {
    sound_play("sndDJump")
    if (sel) {
        setmap_read(global.setrepo)
        convert_settings(settings("settings version"),re_setversion)
        if (global.uses_default_keybinds) {
            vii_sizeof=0
            custom_keys()
        }
        update_fullscreen()
    }
    visible=0
    alarm[0]=50
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
choice=""
if (sel==0) choice+="["+lang("yes")+"]" else choice+=" "+lang("yes")+" "
if (sel==1) choice+="["+lang("no")+"]" else choice+=" "+lang("no")+" "

draw_clear(0)
draw_set_halign(1)
draw_set_font(fntFileSmall)
draw_text(global.width div 2,global.height div 2-48,lang("copy settings"))
draw_text(global.width div 2,global.height div 2,str_ins(lang("copy settings 2"),key_left(vi_keyname),key_right(vi_keyname),key_jump(vi_keyname))+"##"+choice)
draw_set_valign(0)
draw_text(global.width/2,global.height-20,re_version)
draw_set_halign(0)
