#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spike_down = noone
spike_right = noone
spike_left = noone
spike_up = noone
mini_spike_down = noone
mini_spike_right = noone
mini_spike_left = noone
mini_spike_up = noone

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
This object can skin fruit and killers in a room.

An example is provided in rmExtra.
*/

//field spike_down: sprite
//field spike_right: sprite
//field spike_left: sprite
//field spike_up: sprite
//field mini_spike_down: sprite
//field mini_spike_right: sprite
//field mini_spike_left: sprite
//field mini_spike_up: sprite
//field fruit: sprite
//field vine_left: sprite
//field vine_right: sprite
//field grav_flip: sprite
//field grav_normal: sprite
//field blend: color
//field alpha: number(0,1)

//spikes
if (spike_down!=noone) {
    with (SpikeD) {sprite_index=other.spike_down image_blend=other.blend image_alpha=other.alpha}
}
if (spike_left!=noone) {
    with (SpikeL) {sprite_index=other.spike_left image_blend=other.blend image_alpha=other.alpha}
}
if (spike_right!=noone) {
    with (SpikeR) {sprite_index=other.spike_right image_blend=other.blend image_alpha=other.alpha}
}
if (spike_up!=noone) {
    with (SpikeU) {sprite_index=other.spike_up image_blend=other.blend image_alpha=other.alpha}
}

// minispikes
if (mini_spike_down!=noone) {
    with (MiniSpikeDown) {sprite_index=other.mini_spike_down image_blend=other.blend image_alpha=other.alpha}
}
if (mini_spike_left!=noone) {
    with (MiniSpikeLeft) {sprite_index=other.mini_spike_left image_blend=other.blend image_alpha=other.alpha}
}
if (mini_spike_right!=noone) {
    with (MiniSpikeRight) {sprite_index=other.mini_spike_right image_blend=other.blend image_alpha=other.alpha}
}
if (mini_spike_up!=noone) {
    with (MiniSpikeUp) {sprite_index=other.mini_spike_up image_blend=other.blend image_alpha=other.alpha}
}

// fruit
if (fruit!=noone) {
    with (Cherry) {
        if (variable_local_exists("spinner_signature")) continue;
        sprite_index=other.fruit image_blend=other.blend image_alpha=other.alpha
    }
}

//vines
if (vine_left!=noone) {
    with (WallJumpL) {
        if (variable_local_exists("spinner_signature")) continue;
        sprite_index=other.vine_left image_blend=other.blend image_alpha=other.alpha
    }
}
if (vine_right!=noone) {
    with (WallJumpR) {
        if (variable_local_exists("spinner_signature")) continue;
        sprite_index=other.vine_right image_blend=other.blend image_alpha=other.alpha
    }
}

//grav flippers
if (grav_flip!=noone) {
    with (GravFlip) {
        if (variable_local_exists("spinner_signature")) continue;
        sprite_index=other.grav_flip image_blend=other.blend image_alpha=other.alpha
    }
}
if (grav_normal!=noone) {
    with (GravNormal) {
        if (variable_local_exists("spinner_signature")) continue;
        sprite_index=other.grav_normal image_blend=other.blend image_alpha=other.alpha
    }
}
