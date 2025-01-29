#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
blood=settings("blood")
setting=settings("bloodcoll")

// Don't spawn player gibs if dotkid death, keep only blood splatter
if (instance_exists(Player)) if (Player.dotkid) {
    blood=min(blood,2)
}

sprite=spr_idle
sprite_frame=0
celeste=0

if (!blood) {
    bleeding=0
    alarm[1]=room_speed/2
    if (instance_exists(Player)) {
        sprite=Player.sprite
        sprite_frame=Player.sprite_frame
        image_xscale=Player.facing
        image_yscale=Player.vflip
        image_angle=Player.drawangle
        image_blend=Player.image_blend
        image_alpha=Player.image_alpha
        celeste=(global.celeste_cape and Player.djump>=Player.maxjumps)
        if (Player.bow) {
            i=instance_create(x,y,GibParticle) i.sprite_index=sprBow i.gravity=(0.1+random(0.2))*sign(Player.gravity)
        }
    }
    exit
}

gravity=0.4*dt*dt
bleeding=1
alarm[0]=10*blood

if (instance_exists(Player)) {
    hspeed=Player.hspeed/2*dt
    vspeed=Player.vspeed/3*dt
    gravity=Player.baseGrav*Player.vflip*dt*dt
    if (Player.bow) {
        i=instance_create(x,y,GibParticle) i.sprite_index=sprBow i.image_xscale=Player.facing
    }
}

if (blood==3) {
    i=instance_create(x,y-15,GibParticle) i.sprite_index=sprGibsHead
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsBody
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsArm
    i=instance_create(x,y-10,GibParticle) i.sprite_index=sprGibsArm
    i=instance_create(x,y,GibParticle) i.sprite_index=sprGibsFoot
    i=instance_create(x,y,GibParticle) i.sprite_index=sprGibsFoot
}

grav=sign(gravity)

with (GibParticle) {
    if (sprite_index!=sprBow) {
        image_index=irandom(image_number-1)
    }
    gravity=(0.1+random(0.2))*other.grav*dt*dt
    direction=irandom(35)*10
    speed=random(2)*dt
    if (instance_exists(Player)) {
        hspeed+=Player.hspeed*dt
        vspeed+=Player.vspeed*dt/2-1
    }
}

gravity*=0.5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bleeding=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bleeding) {
    emit_blood(7*blood)
}

if (!place_free(x,y)) {
    x-=hspeed
    y-=vspeed
    speed=0
    gravity=0
}

if (alarm[1]) visible=(alarm[1] mod 5)<3
#define Collision_PlayerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) {
    speed=0
    gravity=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_player_sprite(
    sprite,
    sprite_frame,
    x,y,
    image_xscale,
    image_yscale,
    image_angle,
    image_blend,
    image_alpha,
    celeste
)
