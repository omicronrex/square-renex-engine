//write settings to file

var b;

save_keymap()

b=buffer_create()
buffer_write_hex(b,ds_map_write(global.setmap))
buffer_rc4(b,"bugger")
buffer_save(b,global.setfile)
if (!global.disable_settings_repo) buffer_save(b,global.setrepo)
buffer_destroy(b)
