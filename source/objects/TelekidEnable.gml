#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.telekid && !other.dotkid && !other.vvvvvv && !other.cherried && !other.cherried_antigrav && !other.cherried_fireball) {
    sound_play_auto("sndGrow")
    other.telekid=true
    change_skin(skin_telekid)
    change_weapon(weapon_telekid)
}
