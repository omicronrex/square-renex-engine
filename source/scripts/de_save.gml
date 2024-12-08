///de_save()
//returns a string to save the state of the dialogue in the game.

globalvar __de_init,__de_map;

if (__de_init) {
    return ds_map_write(__de_map)
}

return ""
