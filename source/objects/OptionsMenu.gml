#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0

xdraw=global.width/2-276
ydraw=132
xsep=550
ysep=24

numoptions=ds_list_size(global.optlist)
for (i=0;i<numoptions;i+=1) {
    script_execute(ds_list_find_value(global.optlist,i),opt_begin)
}

sprite=spr_idle
sprite_speed=0.2*dt
sprite_frame=0

xcursor=xdraw-18
ycursor=ydraw+(ysep*sel)+18

angle=0
dead=0

event_step()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xcursor=xdraw-18
ycursor=approach(ycursor,ydraw+(ysep*sel)+18,16*dt)

v=macro_updown(vi_pressed)

if (key_shoot(vi_pressed)) {
    sound_kind_stop(0)
    room_goto(rmMenu)
    exit
} else if (v!=0) {
    sound_play("sndJump")
    script_execute(ds_list_find_value(global.optlist,sel),opt_end)
    sel=modwrap(sel+v,0,numoptions)
} else {
    script_execute(ds_list_find_value(global.optlist,sel),opt_step)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///save settings
settings_write()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(global.text_color)

draw_set_halign(1)
draw_set_font(fntOptions)
draw_text(global.width/2,64,lang("optionsmenu"))

for (i=0;i<numoptions;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+(ysep*i),script_execute(ds_list_find_value(global.optlist,i),opt_text))
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+(ysep*i),script_execute(ds_list_find_value(global.optlist,i),opt_value))
}

sprite_frame+=sprite_speed

if (!dead) draw_player_sprite(sprite,sprite_frame,xcursor,ycursor,1,1,angle,$ffffff,1)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,global.height-52,"["+key_shoot(vi_name)+"] "+lang("menuback"))
draw_set_halign(1)
draw_text(global.width/2,global.height-52,re_version)
draw_set_halign(2)
draw_text(global.width-34,global.height-52,"["+key_jump(vi_name)+"] "+lang("menuaccept"))
draw_set_halign(0)

draw_set_color($ffffff)
