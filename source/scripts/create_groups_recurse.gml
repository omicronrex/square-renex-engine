recurse=false

with (object_index) if (recurse) if (instance_place(x-1,y,other.id)) create_groups_recurse()
with (object_index) if (recurse) if (instance_place(x+1,y,other.id)) create_groups_recurse()
with (object_index) if (recurse) if (instance_place(x,y-1,other.id)) create_groups_recurse()
with (object_index) if (recurse) if (instance_place(x,y+1,other.id)) create_groups_recurse()

global.groups[global.groupnum,global.counter]=id
global.counter+=1
