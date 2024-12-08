#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
roomTo=noone
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field roomTo: room
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.lastroom==roomTo && global.sectionwarp) {
    global.sectionwarp=false

    dx=x-global.warpfromx
    dy=y-global.warpfromy

    Player.x+=dx
    Player.y+=dy
    Player.drawx=Player.x
    Player.drawy=Player.y

    camera_default()
}
