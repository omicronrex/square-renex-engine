//fix for weird collision behavior when the speed is very small

if (!global.use_momentum_values)
or (abs(argument0)>=1) return argument0

if (argument0>0) return ceil(argument0)

return floor(argument0)
