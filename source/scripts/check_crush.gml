//check if the player needs to die from getting pushed inside a wall
//returns whether the player was killed

if (!object_is_child_of(Player)) with (Player) check_crush()
else {
    //calculate relative speed towards player
    other.x-=other.hspeed
    other.y-=other.vspeed
    var d1;d1=distance_to_object(other.id)
    other.x+=other.hspeed
    other.y+=other.vspeed
    relative_speed=distance_to_object(other.id)-d1
    if (distance_to_object(other.id)<2+relative_speed) {
        if (!place_free(x,y)) try_unstuck()
        if (!place_free(x,y)) {
            kill_player()
            return 1
        }
    }
}

return 0
