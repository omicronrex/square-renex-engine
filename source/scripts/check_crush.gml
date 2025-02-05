//check if the player needs to die from getting pushed inside a wall
//returns whether the player was killed
var d1,d2,relative_speed;

if (!object_is_child_of(Player)) with (Player) check_crush()
else {
    if (dead) exit

    //calculate relative speed of caller towards player
    other.x-=other.hspeed other.y-=other.vspeed
    d1=distance_to_object(other.id)
    other.x+=other.hspeed other.y+=other.vspeed
    d2=distance_to_object(other.id)

    relative_speed=d1-d2

    if (d2<2+relative_speed) if (!place_free(x,y)) if (!try_unstuck()) {
        kill_player()
        return 1
    }
}

return 0
