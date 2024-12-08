///de_dialog(sprite,sound,speed,text,[remember this,voiceover])
var map;

if (object_index!=DialogEngine) {show_error("Error calling de_dialog without using de_begin.",0) return 0}
if (argument_count<2) {show_error("Error calling de_dialog with less than 2 arguments.",0) return 0}

//args
sprite=argument[0]
sound=argument[1]
text_speed=argument[2]
text=argument[3]
if (argument_count>4) remember=argument[4] else remember=false
if (argument_count>5) voiceover=argument[5] else voiceover=false

//state
if (remember) map=__de_map else map=tempmap
if (!ds_map_exists(map,text)) ds_map_add(map,text,0)
state=ds_map_find_value(map,text)
option_count=0

//process dialog
if (state==0) {
    //hasn't read/accepted yet
    if (donescrolling) {
        if (key_advance) {
            key_advance=false
            //mark as read
            if (voiceover) sound_stop(sound)
            ds_map_replace(map,text,1)
            sound_play(de_accept_sound)
        }
    }
    return 0
}

//finished with this line
return 1
