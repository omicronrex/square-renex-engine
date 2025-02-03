///custom_instance_activation(gameplay)
//custom list of objects that should be active regardless of inside the view or not

//instances that should always be active
instance_activate_object(gm82core_object)
instance_activate_object(ActiveParent)

if (argument0) {
    //instances that should only be active during gameplay
    Player.activated=true
    instance_activate_object(ActiveIngame)
}
