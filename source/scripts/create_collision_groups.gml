///create_collision_groups(object)
//object: object to check
//creates a global list of instance groups based on proximity.
//using this function again forgets previous results.
//global.groupnum: number of groups
//global.groupsize[n]: size of group n
//global.groups[n,k]: k instance of group n

global.groupnum=0
global.counter=0

with (object) recurse=true
with (object) if (recurse) {
    create_groups_recurse()
    global.groupsize[global.groupnum]=global.counter
    global.groupnum+=1
    global.counter=0
}

i=0 repeat (global.groupnum) {
    randcol=random($ffffff)
    j=0 repeat (global.groupsize[i]) {
        global.groups[i,j].image_blend=randcol
    j+=1}
i+=1}
