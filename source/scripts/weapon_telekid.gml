if (!global.contact_saves) {
    with (SavePointParent) {
        if (instance_place(x,y,other.id)) {
            exit
        }
    }
}

if (!instance_exists(TeleKid)) {
    if (!place_free(x+12*image_xscale,y)) exit
    sound_play_auto("sndTelekid")
    i=instance_create(x,y,TeleKid)
    i.direction+=sprite_angle

    trigger_broadcast(tr_playershoot)
}
