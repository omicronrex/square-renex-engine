///sound_play_auto(sound)
///sound_play_auto(sound,pitch)
///sound_play_auto(sound,pitch,pan)
//engine convenience function to improve basic audio in games
var sound,vol,pitch,pan;

if (argument_count==0) {show_error("Called sound_play_auto with no arguments.",0) exit}

sound=argument[0]

vol=min(1,1+((view_wview*2/3)-point_distance(x,y,view_xview+view_wview/2,view_yview+view_hview/2))/(view_wview*2/3))
pitch=1
pan=median(-1,(x-(view_xview+view_wview/2))/(view_wview*2/3),1)

if (argument_count>=2) pitch=argument[1]
if (argument_count>=3) pan=argument[2]

if (settings("stereomode")==false) pan=0
if (global.disable_autopanvol) {pan=0 vol=1}

sound=sound_play_ex(sound,vol,pitch,pan)

if (settings("stereomode")==true && !global.disable_autopanvol) {
    i=instance_create(x,y,SoundEvent)
    i.sound=sound
    i.owner=id
}

return sound
