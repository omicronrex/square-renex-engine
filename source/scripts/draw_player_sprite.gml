///draw_player_sprite(sprite,frame,x,y,xscale,yscale,rotation,color,alpha,[celeste blue cape])
var margin,num,sheet,celeste;

margin=1/256 //margin to prevent texture glitches
num=player_sprite_number(argument[0])

//celeste cape gimmick - use blue frame
if (argument_count>9) celeste=argument[9] else celeste=0

if (settings("anim")) sheet=sprPlayerDefault
else sheet=sprPlayerNeedle

draw_sprite_general(
    sheet,celeste,
    floor(modwrap(argument[1],0,num))*32,floor(argument[0])*32,
    32-margin*2,32-margin*2,
    argument[2]+0*pivot_pos_x(0.5,0.5,argument[6])+pivot_pos_x((margin-16)*argument[4],(margin-23)*argument[5],argument[6]),
    argument[3]+0*pivot_pos_y(0.5,0.5,argument[6])+pivot_pos_y((margin-16)*argument[4],(margin-23)*argument[5],argument[6]),
    argument[4],argument[5],argument[6],
    argument[7],argument[7],argument[7],argument[7],argument[8]
)
