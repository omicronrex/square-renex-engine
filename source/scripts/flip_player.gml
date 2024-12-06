///flip_player([vflip])
//flips player, and then corrects for gravity flipping

if (!object_is_child_of(Player)) with (Player) {if (argument_count) flip_player(argument[0]) else flip_player()}
else if (!dead) {
    if (argument_count) {
        if (vflip!=argument[0]) {
            vflip=argument[0]
            speed=0
            djump=1
            correct_player_mask()
        }
    } else {
        vflip=-vflip
        speed=0
        djump=1
        correct_player_mask()
    }
}
