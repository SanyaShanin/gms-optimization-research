/// @description 

if (x < 0)
	hspeed = abs(hspeed);
if (x > room_width - 32)
	hspeed = -abs(hspeed);
	
if (y < 0)
	vspeed = abs(vspeed);
if (y > room_height - 32)
	vspeed = -abs(vspeed);