///screen_fade([faderate],[unfaderate],[time_to_wait],[color],[start_alpha])

if instance_exists(Fader) exit
var o;o=instance_create(0,0,Fader)

if (argument_count>0) o.faderate=argument[0]
if (argument_count>1) o.unfaderate=argument[1]
if (argument_count>2) o.time_to_wait=argument[2]
if (argument_count>3) o.fadecol=argument[3]
if (argument_count>4) o.alp=argument[4]
