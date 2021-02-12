/// @description Insert description here
// You can write your code in this editor

if (v) {
	switch type {
		// obj
		case 0:
			
			break;
			
		// array
		case 1:
			for(var i = 0; i < a_n; i++) {
				var cx = X[i], cy = Y[i];
				
				draw_rectangle(cx, cy, cx + w, cy + h, 1);
			}
			break;
			
		// struct
		case 2:
			for(var i = 0; i < array_length(structures); i++) {
				var c = structures[i];
				
				draw_rectangle(c.x, c.y, c.x + w, c.y + h, 1);
			}
			break;
			
		// struct list
		case 3:
			for(var i = 0; i < ds_list_size(list); i++) {
				var c = ds_list_find_value(list, i);
				
				draw_rectangle(c.x, c.y, c.x + w, c.y + h, 1);
			}
			break;
			
		// buffer
		case 4:
			
			for(var i = 0; i < b_n; i++) {
				buffer_seek(b, buffer_seek_start, i * b_size);
				var cx = buffer_read(b, buffer_f32),
					cy = buffer_read(b, buffer_f32);
				
				draw_rectangle(cx, cy, cx + w, cy + h, 1);
			}
			break;
	}
}