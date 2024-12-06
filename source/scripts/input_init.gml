globalvar vii_sizeof,vii_i2s,vii_s2i,vii_name,vii_code,vii_default;
globalvar vii_key,vii_press,vii_release,vii_disable,vii_prev;
globalvar vii_store,vii_store_press,vii_store_release,vii_store_release_early;

globalvar joy_old;

custom_keys()

if (vii_sizeof==10) {
    //check for default keybinds for the settings copier
    if  (vii_default[0]==vk_left)
    and (vii_default[1]==vk_right)
    and (vii_default[2]==vk_up)
    and (vii_default[3]==vk_down)
    and (vii_default[4]==vk_shift)
    and (vii_default[5]==ord("Z"))
    and (vii_default[6]==ord("R"))
    and (vii_default[7]==ord("P"))
    and (vii_default[8]==ord("S"))
    and (vii_default[9]==ord("Q")) {
        global.uses_default_keybinds=true
    } else {
        global.uses_default_keybinds=false
    }
}

input_clear()

global.joysupdated=false

global.lastjoystick=noone
global.lastjoyname=""
