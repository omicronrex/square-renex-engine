#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
oldtext=""
cursor=0
oldcursor=0
donescrolling=false
option_count=0
option_current=0
tempmap=ds_map_create()

globalvar __de_init,__de_map;

if (!__de_init) {
    __de_init=true
    __de_map=ds_map_create()
}

textbox_drawer=textbox_default

lock_controls()

key_advance=false
//key_lock=false
die=false

de_settings()
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ds_map_destroy(tempmap)
unlock_controls()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
script_execute(script)

//handle dialog options
if (option_count) {
    if (script_execute(de_input_down,vi_pressed)) {option_current=min(option_current+1,option_count-1) sound_play(de_option_sound)}
    if (script_execute(de_input_up,vi_pressed)) {option_current=max(option_current-1,0) sound_play(de_option_sound)}
    if (key_advance) {
        //choose option
        key_advance=false
        if (remember) map=__de_map else map=tempmap
        //success current dialog
        ds_map_replace(map,text,1)
        //mark option as selected
        ds_map_add(map,option_text[option_current],1)
        //mark every other option as deselected
        i=0 repeat (option_count) {
            ds_map_add(map,option_text[i],0)
        i+=1}
        option_current=0
        sound_play(de_accept_sound)
    }
}

//scrolling text
if (text!=oldtext) {cursor=0 oldcursor=0 if (voiceover) sound_play(sound)}
oldtext=text

if (cursor<string_length(text)) {
    donescrolling=false
    cursor+=text_speed
    if (floor(cursor)>oldcursor) {
        oldcursor=floor(cursor)
        if (!voiceover) {
            c=string_char_at(text,oldcursor)
            if (c!=" " && c!="@") {
                sound_stop(sound)
                sound_play(sound)
            }
        }
    }
    if (key_advance) {
        //show all text
        key_advance=false
        cursor=string_length(text)
        oldcursor=cursor
        sound_stop(sound)
        sound_play(sound)
    }
} else donescrolling=true

str=string_replace_all(string_copy(text,1,oldcursor),"@","")
i=0 repeat (option_count) {
    str+="#"
    if (i==option_current) str+=">" else str+=" "
    str+=option_text[i]
i+=1}

if (donescrolling && !option_count) waiting=true else waiting=false

//control
visible=1

/*if (key_lock) {
    if (script_execute(de_input_advance,vi_released)) key_lock=false
} else*/

key_advance=script_execute(de_input_advance,vi_pressed)

if (die) instance_destroy()
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
script_execute(textbox_drawer,sprite,str,waiting)
