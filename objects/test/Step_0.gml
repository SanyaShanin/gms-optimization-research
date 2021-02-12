
switch type {
	// obj
	case 0:
			
		break;
			
	// array
	case 1:
		for(var i = 0; i < a_n; i++) {
			var cx = X[i], cy = Y[i], sx = hspd[i], sy = vspd[i];
			
			cx += sx;
			cy += sy;
			
			if (cx < 0)
				hspd[i] = abs(sx);
				
			if (cx > room_width - 32)
				hspd[i] = -abs(sx);
				
			if (cy < 0)
				vspd[i] = abs(sy);
				
			if (cy > room_height)
				vspd[i] = -abs(sy);
				
			X[i] = cx;
			Y[i] = cy;
		}
		break;
			
	// struct
	case 2:
		for(var i = 0; i < array_length(structures); i++) {
			var c = structures[i];
				
			c.x += c.hspd;
			c.y += c.vspd;
			
			if (c.x < 0)
				c.hspd = abs(c.hspd);
				
			if (c.x > room_width - 32)
				c.hspd = -abs(c.hspd);
				
			if (c.y < 0)
				c.vspd = abs(c.vspd);
				
			if (c.y > room_height)
				c.vspd = -abs(c.vspd);
		}
		break;
			
	// struct list
	case 3:
		for(var i = 0; i < ds_list_size(list); i++) {
			var c = ds_list_find_value(list, i);
				
			c.x += c.hspd;
			c.y += c.vspd;
			
			if (c.x < 0)
				c.hspd = abs(c.hspd);
				
			if (c.x > room_width - 32)
				c.hspd = -abs(c.hspd);
				
			if (c.y < 0)
				c.vspd = abs(c.vspd);
				
			if (c.y > room_height)
				c.vspd = -abs(c.vspd);
		}
		break;
			
	// buffer
	case 4:
		var bseek = 0;
		buffer_seek(b, buffer_seek_start, bseek);
		for(var i = 0; i < b_n; i++) {
			bseek = i * b_size;
			var cx = buffer_read(b, buffer_f32),
				cy = buffer_read(b, buffer_f32),
				sx = buffer_read(b, buffer_f32),
				sy = buffer_read(b, buffer_f32);
				
			cx += sx;
			cy += sy;
			
			if (cx < 0)
				sx = abs(sx);
				
			if (cx > room_width - 32)
				sx = -abs(sx);
				
			if (cy < 0)
				sy = abs(sy);
				
			if (cy > room_height)
				sy = -abs(sy);
				
			buffer_seek(b, buffer_seek_start, bseek);
			buffer_write(b, buffer_f32, cx);
			buffer_write(b, buffer_f32, cy);
			buffer_write(b, buffer_f32, sx);
			buffer_write(b, buffer_f32, sy);
		}
		break;
}