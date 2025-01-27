#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
max_num=noone
num=3
cycle_length=4
flower_length=4
motion_type="circle"
radius=80

initial_angle=0

time=0
object=Cherry
sprite=sprCherry
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<num;i+=1) {
    instance_destroy_id(o[i])
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Calculate radius and angle based on timer and radius
// Then move each cherry to that location

var i,ct,r,a;

if (cycle_length==0) exit

for (i=0;i<num;i+=1) {
    ct=time+i/max_num
    r=radius
    a=ct*360

    switch (motion_type) {
        case "circle": {
            r=radius
            a=ct*360
        }break
        case "figure8": {
            r=radius*sin(time*pi*4)
            a=ct*360
        }break
        case "chaotic": {
            r=radius
            a=360*dsin(a)
        }break
        case "stutter": {
            r=radius
            a=ct*360+30*dsin(a*num)
        }break
        case "flower": {
            r=radius*(1+sin(time*pi*2*flower_length))/2
            a=ct*360
        }break
    }

    o[i].x=x+lengthdir_x(r,a+initial_angle)
    o[i].y=y+lengthdir_y(r,a+initial_angle)
}

image_angle=a+initial_angle

time+=dt/(cycle_length*50)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*description
    Creates a rotating circle of objects.
    Room editor preview only works if you set motion_type, max_num, and num.
    It also only shows cherries on the preview, but you can set it to any object.
    cycle_length is in seconds, give it negative numbers to move clockwise.
    flower_length is in cycles per revolution, only used for the "flower" motion type.
*/
//field max_num: number
//field num: number
//field cycle_length: number
//field flower_length: number
//field motion_type: enum("circle","figure8","stutter","chaotic","flower")
//field radius: radius
//field object: object
//field sprite: sprite
//field initial_angle: angle

//credits to voraciousreader for the "flower" motion type + num/max_num distinction

/*preview
    var i,ct,r,a;

    if (!FieldDefined("motion_type")|| !FieldDefined("num")) {
        draw_sprite(Sprite("sprSpinner"),0,x,y)
        exit
    }

    if (!FieldDefined("max_num")) max_num=num

    if (cycle_length==0) time=0
    else time=(current_time/16)/(cycle_length*50)

    for (i=0;i<num;i+=1) {
        ct=time+i/max_num

        switch (motion_type) {
            case "figure8": {
                r=radius*sin(time*pi*4)
                a=ct*360
            }break
            case "chaotic": {
                r=radius
                a=360*dsin(a)
            }break
            case "stutter": {
                r=radius
                a=ct*360+30*dsin(a*num)
            }break
            case "flower": {
                r=radius*(1+sin(time*pi*2*flower_length))/2
                a=ct*360
            }break
            default: {
                r=radius
                a=ct*360
            }break
        }

        if (!FieldDefined("sprite")) draw_sprite(Sprite("sprCherry"),0,x+lengthdir_x(r,a+initial_angle),y+lengthdir_y(r,a+initial_angle))
        else draw_sprite(Sprite(Field("sprite"),0),0,x+lengthdir_x(r,a+initial_angle),y+lengthdir_y(r,a+initial_angle))
    }
    if (Field("cycle_length")>0) draw_sprite_ext(Sprite("sprSpinner"),0,x,y,1,1,a+initial_angle,c_white,1)
    else draw_sprite_ext(Sprite("sprSpinner"),0,x,y,1,-1,a+initial_angle,c_white,1)
*/

if (max_num==noone) max_num=num

var i;

for (i=0;i<num;i+=1) {
    o[i]=instance_create(x,y,object)
    o[i].sprite_index=sprite
    o[i].depth=depth
    o[i].spinner_signature=true
    o[i].destroy_outside=false //only relevant for cherries
}

event_step()
