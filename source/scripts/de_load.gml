///de_load(string)
//loads dialogue state from a string.

globalvar __de_init,__de_map;

if (!__de_init) {
    __de_init=true
    __de_map=ds_map_create()
}

if (is_string(argument0))
    if (argument0!="")
        ds_map_read(__de_map,argument0)
