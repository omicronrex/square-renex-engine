var map,i;

map=ds_map_create()

for (i=0;i<vii_sizeof;i+=1) {
    if (vii_code[i]<7) vii_code[i]=vii_default[i]
    ds_map_add(map,vii_name[i],vii_code[i])
}

settings("keymap",ds_map_write(map))

ds_map_destroy(map)
