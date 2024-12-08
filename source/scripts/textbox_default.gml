///textbox_default(sprite,text,waiting)
//example textbox draw script.
var sprite,text,waiting;

sprite=argument0
text=argument1
waiting=argument2

var dx,dy,dw,dh,tx,ty;

dx=view_xview
dy=view_yview
dw=view_wview
dh=view_hview

if (Player.y<dy+dh/2) dy=dh-160

draw_set_color(0)
draw_rectangle(dx+32,dy+32,dx+dw-32-1,dy+128-1,0)

draw_set_color($808080)
draw_rectangle(dx+48,dy+48,dx+112-1,dy+112-1,0)
draw_sprite_stretched(sprite,0,dx+48,dy+48,64,64)

draw_set_color($ffffff)
draw_rectangle(dx+32,dy+32,dx+dw-32-1,dy+128-1,1)
draw_rectangle(dx+48,dy+48,dx+112-1,dy+112-1,1)

if (waiting) {
    tx=dx+dw-32-16
    ty=dy+128-16
    draw_triangle(tx-8,ty-8,tx+8,ty-8,tx,ty+8,0)
}

draw_set_font(fntFileSmall)
draw_text_ext(dx+128,dy+48,str,-1,624)
