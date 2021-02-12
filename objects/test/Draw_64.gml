/// @description Insert description here
// You can write your code in this editor

var n = 0;
switch type {
	case 0: n = instance_number(colliser); break;
	case 1: n = a_n; break;
	case 2: n = array_length(structures); break;
	case 3: n = ds_list_size(list); break;
	case 4: n = b_n; break;
}

draw_set_color(c_white);
draw_text(10, room_height - 25*3, string(type) + "\n" + string(fps) + "\n" + string(n));
