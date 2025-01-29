var dy,xs,ys;

if (argument0=="mask") {
    if (vflip==-1) {
        if (global.use_original_mask || (global.valign05_vdiet && frac(y)==0.5)) mask_index=sprMaskPlayerFlip
        else mask_index=sprMaskNeedleFlip
    } else {
        if (global.use_original_mask || (global.valign05_vdiet && frac(y)==0.5)) mask_index=sprMaskPlayer
        else mask_index=sprMaskNeedle
    }
}

if (argument0=="step") {
    sprite_previous=sprite
    if (ladder) {
        if (hspeed!=0) sprite=spr_climbside
        else if (vspeed!=0) sprite=spr_climbup
        else sprite=spr_climb
    } else if (hang) {
        sprite=spr_slide
    } else if (!onGround) {
        if (vspeed*vflip<-0.05) sprite=spr_jump
        if (vspeed*vflip>0.05) sprite=spr_fall
    } else if (input_h!=0) {
        sprite=spr_run
    } else {
        sprite=spr_idle
    }

    if (settings("anim")) {
        switch (sprite) {
            case spr_idle:       sprite_speed=0.2 break
            case spr_run:        sprite_speed=mmf_animspeed(70,80) break
            case spr_jump:       sprite_speed=0 sprite_frame+=0.5 if (sprite_frame>=4) sprite_frame-=2 break
            case spr_fall:       sprite_speed=0 sprite_frame+=0.5 if (sprite_frame>=4) sprite_frame-=2 break
            case spr_slide:      sprite_speed=0.5 break
            case spr_climb:      sprite_speed=0.1 break
            case spr_climbup:    sprite_speed=0.2 break
            case spr_climbside:  sprite_speed=0.2 break
            case spr_taunt:      break
        }
    } else {
        switch (sprite) {
            case spr_idle:       sprite_speed=0.2 break
            case spr_run:        sprite_speed=0.5 break
            case spr_jump:       sprite_speed=0.5 break
            case spr_fall:       sprite_speed=0.5 break
            case spr_slide:      sprite_speed=0.5 break
            case spr_climb:      sprite_speed=0.1 break
            case spr_climbup:    sprite_speed=0.2 break
            case spr_climbside:  sprite_speed=0.2 break
            case spr_taunt:      break
        }
    }

    sprite_number=player_sprite_number(sprite)

    sprite_frame=modwrap(sprite_frame+sprite_speed,0,sprite_number)
    if (sprite!=sprite_previous) sprite_frame=0

    if (global.angle_slopes) sprite_angle+=angle_difference(sprite_angle,slope_angle)*0.4

    if (dot_hitbox) image_blend=$808080
    else image_blend=$ffffff
}

if (argument0=="draw") {
    //slope angle offset
    dy=floor(drawy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1))
    xs=abs(image_xscale)*facing
    ys=abs(image_yscale)*vflip

    celeste=(global.celeste_cape and djump>=maxjumps)

    draw_player_sprite(drawspr,drawframe,drawx,drawy,xs,ys,drawangle,image_blend,image_alpha,celeste)

    if (bow) {
        dy=floor(bowy+abs(lengthdir_y(2,drawangle))*vflip+(vflip==-1))
        if (drawspr=spr_idle && floor(drawframe)==3) dy+=vflip //bobbing
        draw_sprite_ext(sprBow,0,floor(bowx),dy,xs,ys,drawangle,image_blend,image_alpha)
    }

    if (dot_hitbox) {
        draw_sprite(sprWhiteDot,0,floor(drawx),floor(drawy))
    }
}
