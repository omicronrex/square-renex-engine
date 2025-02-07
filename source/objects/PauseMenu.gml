#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
pausew=global.width
pauseh=global.height
storew=global.APPwidth
storeh=global.APPheight
storef=global.APPfilter

bg=background_create_from_surface(application_surface,0,0,storew,storeh,0,0)

global.pause=true
instance_deactivate_all_safe(false)
memspd=room_speed
alarm[0]=room_speed

if (settings("pause sounds")) sound_pause_all()

//options
xdraw=60
ydraw=100
xsep=300
ysep=24

angle=0
dead=0

sel=-1
numoptions=ds_list_size(global.optlist)
optlist=ds_list_create()
for (i=0;i<numoptions;i+=1) {
    option=ds_list_find_value(global.optlist,i)
    if (script_execute(option,opt_inpause)) {
        ds_list_add(optlist,option)
        script_execute(option,opt_begin)
    }
}
numoptions=ds_list_size(optlist)

xcursor=xdraw-18
ycursor=ydraw+9
sprite=sprPlayerIdle
image_speed=0.2*50/room_speed
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (input_anykey()) {
    room_speed=memspd
    image_speed=0.2
    alarm[0]=room_speed
}

if (sel!=-1) {
    script_execute(ds_list_find_value(optlist,sel),opt_end)
}

global.pause=false

background_delete(bg)

input_clear()
visible=0

if (settings("pause sounds")) sound_resume_all()

room_speed=memspd

World.pause_delay=global.pause_delay_time

if (global.instance_deactivation) update_activation()
else instance_activate_all_safe()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_speed=10
image_speed=0.2*50/room_speed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (input_anykey()) {
    room_speed=memspd
    alarm[0]=room_speed*3
    //break
}

image_speed=0.2*50/room_speed

if (sel==-1) {
    if (key_jump(vi_pressed)) sel=0
} else {
    xcursor=xdraw-18
    ycursor=approach(ycursor,ydraw+(ysep*sel)+9,16*dt)
    option=ds_list_find_value(optlist,sel)
    v=macro_updown(vi_pressed)
    if (v!=0) {
        script_execute(option,opt_end)
        sel=modwrap(sel+v,0,numoptions)
    } else {
        script_execute(option,opt_step)
    }
    if (key_shoot(vi_pressed)) {
        script_execute(option,opt_end)
        sel=-1
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///draw pause screen

var t,timeText;

d3d_set_projection_ortho(0,0,storew,storeh,0)
draw_clear_alpha(0,1)
draw_set_color(global.text_color)

//fix weird alpha on nvidia
d3d_set_alphablend(false)
texture_set_interpolation(storef)
draw_background_stretched_ext(bg,0,0,storew,storeh,$707070,1)
texture_set_interpolation(0)
d3d_set_alphablend(true)

d3d_set_projection_ortho(0,0,global.width,global.height,0)

draw_set_font(fntFileBig)
draw_text(40,36,lang("pausemenu"));

draw_set_font(fntFileSmall)
if (sel==-1) {
    draw_text(40,ydraw,string_replace(lang("pauseoptions"),"%",key_jump(vi_name)))
} else {
    for (i=0;i<numoptions;i+=1) {
        option=ds_list_find_value(optlist,i)
        draw_set_halign(0)
        draw_text(xdraw,ydraw+(ysep*i),script_execute(option,opt_text))
        draw_set_halign(2)
        draw_text(xdraw+xsep,ydraw+(ysep*i),script_execute(option,opt_value))
    }
    draw_set_halign(0)
    draw_sprite_ext(sprite,floor(image_index),xcursor,ycursor,1,1,angle,$ffffff,1)
}

var batt_info,batt_status;

batt_info=""
batt_status=get_battery_status()
if (batt_status) {
    batt_info=lang("battery")+string(get_battery_level())
    if (batt_status==2) batt_info+="("+lang("battery charge")+")"
}

draw_set_valign(2)
    draw_text(40,global.height-36,
        lang("deaths")+": "+string(savedata("deaths"))+"#"+
        lang("time")+": "+format_time(savedata("time"))+"#"+
        lang("systime")+": "+date_time_string(date_current_time())+"#"+
        batt_info
    )
draw_set_valign(0)

draw_set_color($ffffff)
