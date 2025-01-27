#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spike=""
mini_spike=""

fruit = noone

blend = $ffffff
alpha = 1

vine_left = noone
vine_right = noone

grav_flip = noone
grav_normal = noone
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
This object can skin fruit and killers in a room,
by adding the "spike" or "mini_spike" variables
to the end of the sprite names, or by setting
the fruit sprite directly.

Spike names must start with:
  - sprSpikeDown
  - sprSpikeLeft
  - sprSpikeRight
  - sprSpikeUp

Minispike names must start with:
  - sprMiniSpikeDown
  - sprMiniSpikeLeft
  - sprMiniSpikeRight
  - sprMiniSpikeUp
*/

//field spike: string
//field mini_spike: string
//field fruit: sprite
//field vine_left: sprite
//field vine_right: sprite
//field grav_flip: sprite
//field grav_normal: sprite
//field blend: color
//field alpha: number(0,1)

//spikes
if (spike!="") {
    execute_string("
        s_d=sprSpikeDown"+spike+"
        s_l=sprSpikeLeft"+spike+"
        s_r=sprSpikeRight"+spike+"
        s_u=sprSpikeUp"+spike+"
    ")
    with (SpikeD) {sprite_index=other.s_d image_blend=other.blend image_alpha=other.alpha}


    with (SpikeL) {sprite_index=other.s_l image_blend=other.blend image_alpha=other.alpha}


    with (SpikeR) {sprite_index=other.s_r image_blend=other.blend image_alpha=other.alpha}


    with (SpikeU) {sprite_index=other.s_u image_blend=other.blend image_alpha=other.alpha}
}

// minispikes
if (mini_spike!="") {
    execute_string("
        ms_d=sprMiniSpikeDown"+mini_spike+"
        ms_l=sprMiniSpikeLeft"+mini_spike+"
        ms_r=sprMiniSpikeRight"+mini_spike+"
        ms_u=sprMiniSpikeUp"+mini_spike+"
    ")
    with (MiniSpikeDown) {sprite_index=other.ms_d image_blend=other.blend image_alpha=other.alpha}



    with (MiniSpikeLeft) {sprite_index=other.ms_l image_blend=other.blend image_alpha=other.alpha}



    with (MiniSpikeRight) {sprite_index=other.ms_r image_blend=other.blend image_alpha=other.alpha}



    with (MiniSpikeUp) {sprite_index=other.ms_u image_blend=other.blend image_alpha=other.alpha}
}

// fruit
if (fruit!=noone) {
    with (Cherry) {sprite_index=other.fruit image_blend=other.blend image_alpha=other.alpha}
}

//vines
if (vine_left!=noone) {
    with (WallJumpL) {sprite_index=other.vine_left image_blend=other.blend image_alpha=other.alpha}
}
if (vine_right!=noone) {
    with (WallJumpR) {sprite_index=other.vine_right image_blend=other.blend image_alpha=other.alpha}
}

//grav flippers
if (grav_flip!=noone) {
    with (GravFlip) {sprite_index=other.grav_flip image_blend=other.blend image_alpha=other.alpha}
}
if (grav_normal!=noone) {
    with (GravNormal) {sprite_index=other.grav_normal image_blend=other.blend image_alpha=other.alpha}
}
