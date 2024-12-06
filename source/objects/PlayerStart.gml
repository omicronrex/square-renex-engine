#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(World)) {show_error("World object not found. Please put rmInit at the top of your room list.",1) exit}

if (!instance_exists(savedata("obj"))) {
    (instance_create(x+17*image_xscale,y+23,savedata("obj"))).facing=image_xscale
}

warpid=""
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field warpid: string
