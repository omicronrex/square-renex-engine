#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joy=-1
sel=vii_sizeof

xdraw=120
ydraw=80
xsep=560
ysep=24

ycursor=0

setting=false

for (i=0;i<vii_sizeof;i+=1) {
    keyname[i]=script_execute(vii_i2s[i],vi_name)
}
keyname[vii_sizeof ]="Set Controls"
keytext[vii_sizeof]=""

show_message_left(lang("joytokey"),300)

lit=0
locked=0

event_user(0)


image_speed=0.2*dt
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
keytext[vii_sizeof]=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (joystick_count()!=joycount) {
    joy=0
    setting=false
    event_user(0)
}

//you need to be able to back out if your joystick isn't working
if (key_shoot(vi_pressed)) {
    if (global.lastjoystick==noone) {
        if (setting) {
            setting=false
            keytext[vii_sizeof]=""
            event_user(0)
        } else {
            input_clear()
            i=instance_create(x,y,OptionsMenu)
            i.sel=mempos
            i.ycursor=ycursor
            instance_destroy()
        }
    } else {
        if (!setting) show_message_right(lang("joyusekey"),300)
    }
} else if (!setting) {
    lit=0
    for (i=0;i<joystick_count();i+=1) {
        for (j=0;j<16;j+=1) {
            if (joystick_check_button(i,j)) {
                joy=i
                lit=1
            }
        }
    }

    sel=vii_sizeof
    if (key_jump(vi_pressed)) {
        if (global.lastjoystick==noone) {
            if (joy!=-1) {
                setting=true
                keytext[vii_sizeof]="["+key_shoot(vi_keyname)+"] to cancel"
                sel=0
                show_message_right("["+key_jump(vi_keyname)+"]"+lang("joyskipkey"),300)
                joy_snap(joy)
            } else {
                show_message_right(lang("joypushtosel"),300)
            }
        } else {
            if (!setting) show_message_right(lang("joyusekey"),300)
        }
    }
} else {
    keytext[sel]="Press new button..."

    new=joy_compare(joy)

    if (new!="") {
        if (!locked) {
            locked=1
            joy_button[joy,sel]=new
            keytext[sel]=new
            sel+=1
        }
    } else {
        locked=0    
        if (key_jump(vi_pressed) && global.lastjoystick==noone) {
            keytext[sel]=joy_button[joy,sel]
            if (string(keytext[sel])="0") keytext[sel]="Unset"
            sel+=1
        }
    }

    if (sel=vii_sizeof) {
        for (i=0;i<vii_sizeof;i+=1) {
            settings("joymap_"+name+"_"+string(i),joy_button[joy,i])
        }
        settings("joymap_"+name+"_set",1)
        setting=false
        global.joysupdated=true
        keytext[vii_sizeof]="All set!"
        alarm[0]=room_speed*2
    }
}

if (!setting) {
    if (joy==-1) {
        for (b=0;b<vii_sizeof;b+=1) {
            keytext[b]="-"
        }
    } else {
        for (b=0;b<vii_sizeof;b+=1) {
            keytext[b]=joy_button[joy,b]
            if (string(keytext[b])="0") keytext[b]="Unset"
        }
    }
}

ycursor=approach(ycursor,ydraw+sel*ysep+52,16*dt)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
joycount=joystick_count()

for (j=0;j<joycount;j+=1) {
    name=joystick_name(j)
    for (b=0;b<vii_sizeof;b+=1) {
        joy_button[j,b]=settings("joymap_"+name+"_"+string(b))
    }
}
/*
if (joycount==0) {
    input_clear()
    i=instance_create(x,y,OptionsMenu)
    i.sel=mempos
    i.ycursor=i.ydraw+(i.ysep*i.sel)+18
    instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(global.text_color)

draw_set_halign(1)
draw_set_font(fntOptions)
if (joycount==0) {
    draw_text(400,64,"- "+lang("no bitches?")+" -")
} else if (joy==-1) {
    draw_text(400,64,"- "+lang("joypushtosel")+" -")
} else {
    if (lit) draw_text(400,64,"> ("+string(joy+1)+") "+joystick_name(joy)+" <")
    else draw_text(400,64,"- ("+string(joy+1)+") "+joystick_name(joy)+" -")
}

for (i=0;i<=vii_sizeof;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+(i)*ysep+32,keyname[i])
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+(i)*ysep+32,keytext[i])
}

draw_sprite(sprite_index,floor(image_index),xdraw-20,ycursor)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,556,"["+key_shoot(vi_keyname)+"] Back")
draw_set_halign(2)
draw_text(766,556,"["+key_jump(vi_keyname)+"] Accept")
draw_set_halign(0)

draw_set_color($ffffff)
