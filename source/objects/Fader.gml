#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///general-purpose screen fader

faderate=0.15    //how fast to fade
unfaderate=0.15  //how fast to unfade
time_to_wait=0   //how long to wait until unfading
fadecol=0        //what color to fade with
alp=0            //alpha
fadestate=1      //0=not fading, 1=fading, 2=unfading
w=global.width
h=global.height
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=skip draw
*/
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (alp==1 && fadestate==1 && time_to_wait==0) fadestate=2
else if (time_to_wait) time_to_wait-=1

if (fadestate==1) alp=approach(alp,1,faderate)
else if (fadestate==2) alp=approach(alp,0,unfaderate)

if (alp>0) {
    draw_set1(fadecol,alp)
    draw_rectangle(0,0,w,h,0)
    draw_reset()
} else if (fadestate==2) instance_destroy()
