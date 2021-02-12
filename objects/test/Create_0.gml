/// @description Insert description here
// You can write your code in this editor

w = 32;
h = 32;
v = true;

show_debug_overlay(true)

function SetVisible(v) {
	if (v == undefined)
		v = !self.v
	self.v = v;
	with colliser visible = v;
}

function NextType() {
	type = (type + 1) mod 5;
	Clear();
}

function mstruct() constructor {
	var data = test.GetRandom();
	x = data.x;
	y = data.y;
	hspd = data.hspd;
	vspd = data.vspd;
}

function GetRandom() {
	return {
		x: irandom(room_width),
		y: irandom(room_height),
		hspd: choose(-5, 5),
		vspd: choose(-5, 5)
	}
}

type = 0
function SpawnObjects(n) {
	repeat n {
		var data = GetRandom();
		var o = instance_create_layer(data.x, data.y, layer, colliser);
		o.hspeed = data.hspd;
		o.vspeed = data.vspd;
		o.visible = v;
	}
}

a_n = 0;
X = [];
Y = [];
hspd = [];
vspd = [];
function SpawnArrays(n) {
	repeat n {
		var data = GetRandom();
		X[a_n] = data.x;
		Y[a_n] = data.y;
		hspd[a_n] = data.hspd;
		vspd[a_n] = data.vspd;
		a_n++;
	}
}

structures = [];
function SpawnStructures(n) {
	repeat n array_push(structures, new mstruct());
}

list = ds_list_create();
function SpawnStructuresList(n) {
	repeat n ds_list_add(list, new mstruct());
}

b_n = 0;
b_size = buffer_sizeof(buffer_f32) * 4
b = buffer_create(b_size * 10000, buffer_fixed, 1);
function SpawnBuffers(n) {
	repeat n {
		buffer_seek(b, buffer_seek_start, b_size * b_n);
		var data = GetRandom();
		buffer_write(b, buffer_f32, data.x);
		buffer_write(b, buffer_f32, data.y);
		buffer_write(b, buffer_f32, data.hspd);
		buffer_write(b, buffer_f32, data.vspd);
		b_n++;
	}
}

function Spawn(n) {
	switch type {
		case 0:	SpawnObjects(n); break;
		case 1:	SpawnArrays(n); break;
		case 2:	SpawnStructures(n); break;
		case 3:	SpawnStructuresList(n); break;
		case 4:	SpawnBuffers(n); break;
	}
}

function Clear() {
	instance_destroy(colliser);
	X = [];
	Y = [];
	hspd = [];
	vspd = [];
	structures = [];
	b_n = 0;
	ds_list_clear(list);
}