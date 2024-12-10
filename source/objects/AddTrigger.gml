#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
instance=noone
trigger_type="soft"
retrigger=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_step,ev_step_normal)
} else event_inherited()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_other,ev_outside)
} else event_inherited()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
AddTrigger will turn any object into a trap.
It also lets traps move more than once with the 'retrigger' field.
However, you must place Triggered objects on top of the AddTrigger itself if you use that.

If you don't supply an instance, it will look for the first one underneath.

When using a "hard" trigger, the instance gets moved by AddTrigger,
instead of moving by itself.
*/

//field instance: instance
//field trigger_type: enum("soft","hard") - default: soft
//field retrigger: false

event_inherited()

if (!instance) {
    y=-9999999999
    instance=instance_position(x,ystart,all)
    if (!instance) {
        instance=instance_place(x,ystart,all)
        if (!instance) {
            show_error(str_cat("AddTrigger at (",x,",",ystart,") did not find an instance to add a trigger to."),0)
            instance_destroy()
            exit
        }
    }
}
y=ystart

addtrigger_vars()
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    with (instance) event_perform_object(Gizmo,ev_other,ev_end_of_path)
} else event_inherited()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///follow instance
if (!instance_exists(instance)) {
    instance_destroy()
    exit
}

if (!retrigger) {
    sprite_index=instance.sprite_index
    image_speed=instance.image_speed
    image_index=instance.image_index
    mask_index=instance.mask_index
    persistent=instance.persistent
}

if (trigger_type=="hard") {
    instance.image_angle=image_angle
    instance.x=x
    instance.y=y
    instance.xprevious=xprevious
    instance.yprevious=yprevious
    instance.xstart=xstart
    instance.ystart=ystart
    instance.hspeed=hspeed
    instance.vspeed=vspeed
    instance.direction=direction
    instance.speed=speed
    instance.friction=friction
    instance.gravity=gravity
    instance.gravity_direction=gravity_direction
    instance.image_xscale=image_xscale
    instance.image_yscale=image_yscale
    instance.image_alpha=image_alpha
}
#define Trigger_Trap is Triggered
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (trigger_type=="soft") {
    if (retrigger) addtrigger_vars()
    with (instance) event_perform_object(Gizmo,ev_trigger,tr_traptriggered)
} else event_inherited()
