if (framefac==ff_immediate) {
    //immediate mode for 50hz no slowdown
    drawx=x
    drawy=y
    drawspr=sprite
    drawframe=sprite_frame
    drawangle=image_angle+sprite_angle
    bowx=newbowx
    bowy=newbowy
} else {
    drawx=lerp(oldx,newx,framefac)
    drawy=lerp(oldy,newy,framefac)
    drawspr=oldspr
    drawframe=oldfr
    drawangle=lerp(oldangle,newangle,framefac)
    bowx=lerp(oldbowx,newbowx,framefac)
    bowy=lerp(oldbowy,newbowy,framefac)
}

if (vflip==1) drawy=floor(drawy)
else drawy=ceil(drawy)
