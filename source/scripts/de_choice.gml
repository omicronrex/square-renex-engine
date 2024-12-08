///de_choice(text)
var text; text=argument0

if (object_index!=DialogEngine) {show_error("Error calling de_choice without using de_begin.",0) return 0}

if (ds_map_exists(__de_map,text)) {
    //remember permanently
    return ds_map_find_value(__de_map,text)
} else if (ds_map_exists(tempmap,text)) {
    //remember momentarily
    return ds_map_find_value(tempmap,text)
} else {
    //display options
    option_text[option_count]=text
    option_count+=1
    return 0
}
