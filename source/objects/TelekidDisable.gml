#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.telekid) {
    sound_play_auto("sndShrink")
    other.telekid=false
    change_skin(skin_default)
    change_weapon(weapon_default)
}
