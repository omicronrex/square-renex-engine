///de_begin(script,[textbox script])
//script: dialog script to execute
//textbox: script to draw the textbox

with (DialogEngine) exit
with (instance_create(0,0,DialogEngine)) {
    script=argument[0]
    if (argument_count>1) textbox_drawer=argument[1]
}
