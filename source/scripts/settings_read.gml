//load settings from file and apply them

ds_map_clear(global.setmap)

settings_default()

settings("settings version",re_setversion)

if (file_exists(global.setfile)) {
    //settings exist
    setmap_read(global.setfile)
} else {
    //initialize a new settings file
    settings_write()
}

//unpack settings
load_keymap()
sound_kind_volume(0,settings("sfxvol"))
sound_kind_volume(3,settings("sfxvol"))
sound_kind_volume(1,settings("musvol"))
