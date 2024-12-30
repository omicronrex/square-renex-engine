///addtrigger_vars()
//script so we don't use the same code twice

if (trigger_type=="hard") {
    x=instance.x
    y=instance.y
    sprite_index=instance.sprite_index
    image_speed=instance.image_speed
    image_index=instance.image_index
    image_angle=instance.image_angle
    mask_index=instance.mask_index
    persistent=instance.persistent
    depth=instance.depth
    solid=instance.solid
    x=instance.x
    y=instance.y
    xprevious=instance.xprevious
    yprevious=instance.yprevious
    xstart=instance.xstart
    ystart=instance.ystart
    hspeed=instance.hspeed
    vspeed=instance.vspeed
    direction=instance.direction
    speed=instance.speed
    friction=instance.friction
    gravity=instance.gravity
    gravity_direction=instance.gravity_direction
} else {
    with (instance) {
        dir=other.dir
        spd=other.spd
        hsp=other.hsp
        vsp=other.vsp
        path=other.path
        path_endaction=other.path_endaction
        path_speed=other.path_speed
        path_absolute=other.path_absolute
        path_scaling=other.path_scaling
        sound=other.sound
        
        scaleh=other.scaleh
        scalev=other.scalev
        scaling=other.scaling
        
        rotate=other.rotate
        rotating=other.rotating
        
        no_destroy_outside=other.no_destroy_outside
        trap_redir_index=other.trap_redir_index
        trap_stop_index=other.trap_stop_index
        
        trigger_on_create=other.trigger_on_create
        
        grav=other.grav
        grav_dir=other.grav_dir
        
        move_to_xy[0]=other.move_to_xy[0]
        move_to_xy[1]=other.move_to_xy[1]
        move_relative=other.move_relative
                
        move_to_xy_grav[0]=other.move_to_xy_grav[0]
        move_to_xy_grav[1]=other.move_to_xy_grav[1]
        move_grav=other.move_grav
        
        move_spd=other.move_spd
        move_t=0
        
        execute_code=other.execute_code
        execute_code_timer=other.execute_code_timer
        execute_code_t=0
        executed=0
        
        trap_delay=other.trap_delay
        
        trg=other.trg
    }
}
