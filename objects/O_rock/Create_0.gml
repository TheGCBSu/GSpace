speed = 1;
direction = random(360);
image_angle = random(360);
if random(1) < 0.5 {
    // Spin clockwise
    spin_direction = 1;
} else {
    // Spin counterclockwise
    spin_direction = -1;
}
var randomizer = irandom_range(1,5);
var color;
switch(randomizer){
case 1: color=c_ltgray; break;
case 2: color=c_white; break;
case 3: color=c_silver; break;
case 4: color=c_dkgray; break;
case 5: color=c_gray; break;
}
image_blend=color;