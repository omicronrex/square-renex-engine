//move the player around to fix collisions when flipping gravity
var oldy;

if (vflip>0) oldy=bbox_top
else oldy=bbox_bottom

script_execute(global.player_skin,"mask")

if (vflip>0) move_player(x,y+oldy-bbox_top,1)
else move_player(x,y+oldy-bbox_bottom,1)
