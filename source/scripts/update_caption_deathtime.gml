if (global.show_deathtime && room!=global.difficulty_room) {
    if (global.num_difficulties>1) diff=" - "+global.name_difficulties[difficulty] else diff=""

    room_caption=str_cat(
        global.game_title,
        " - "+global.savename,
        diff,
        " - "+lang("deaths")+": ",savedatap("deaths"),
        " - "+lang("time")+": ",format_time(savedatap("time")),
        pick(global.lastjoyname!="",""," - "+global.lastjoyname),
        pick(savedatap("clear"),""," - "+lang("fileclear"))
    )
} else room_caption=global.game_title
