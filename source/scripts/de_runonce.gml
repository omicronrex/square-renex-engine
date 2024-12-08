///de_runonce(id,[remember this])
//executes the following code only once.

var uuid,remember;

if (object_index!=DialogEngine) {show_error("Error calling de_runonce without using de_begin.",0) return 0}


uuid=argument[0]
if (argument_count>1) remember=argument[1]
else remember=false


if (ds_map_exists(__de_map,uuid)) {
    return 0
} else if (ds_map_exists(tempmap,uuid)) {
    return 0
} else {
    if (remember) ds_map_add(__de_map,uuid,true)
    else ds_map_add(tempmap,uuid,true)
    return 1
}
