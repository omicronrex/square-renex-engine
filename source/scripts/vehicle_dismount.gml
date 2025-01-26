//can be called either in the vehicle, or in the player that is riding a vehicle

if (object_is_child_of(SuperVehicle)) {
    event_trigger(tr_dismount)
    with (passenger) {
        script_execute(global.player_skin,"step")
        repeat (2) player_update_sprite()
    }
} else {
    with (SuperVehicle) if (active && passenger==other.id) vehicle_dismount()
}
