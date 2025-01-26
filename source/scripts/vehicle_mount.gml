//called in the vehicle object - enables the vehicle, mounts 'other'
var plr;

//abort if other object isn't a Player
if (!object_other_is_child_of(Player)) exit
plr=other.id

//don't mount if player is dead
if (plr.dead) exit

//don't double-mount
with (SuperVehicle) if (active && passenger==plr) exit

passenger=plr
event_trigger(tr_mount)
