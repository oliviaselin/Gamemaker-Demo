/// @description Insert description here
// You can write your code in this editor

//get player input
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space) || keyboard_check(ord("W"));


// calculate movement
var move = key_right - key_left; // this var will only last for 1 frame
hsp = move * walksp;
vsp = vsp + grv;


// jump movement
if (place_meeting(x,y+1,oGrassGround) && (key_jump)) {
	vsp = -7;
}

//horizontal collision 
if (place_meeting(x+hsp, y, oWall) || place_meeting(x+hsp, y, oGrassGround)) {

	while (!place_meeting(x+sign(hsp), y, oWall) && !place_meeting(x+sign(hsp), y, oGrassGround)) { //keep moving until hit wall
		x = x + sign(hsp);
	}
	
	hsp = 0; // stop at wall
}

else {
	x = x + hsp;	
}


//vertical collision 
if (place_meeting(x, y+vsp, oGrassGround)) {

	while (!place_meeting(x, y+sign(vsp), oGrassGround)) { //keep moving until hit wall
		y = y + sign(vsp);
	}
	
	vsp = 0; // stop at wall
}

else {
	y = y + vsp;	
}






//animation

if (!place_meeting(x,y+1,oGrassGround)){ // in air
		sprite_index = sKatA;
		image_speed = 0;
		if (sign(vsp) > 0) { // if falling
			image_index = 1;
		}
		else {
			image_index = 0; // if jumping
		}
}
else { // not falling
	image_speed = 1;
	if (hsp == 0) { //not moving
		sprite_index = sKat;	
	}
	else { //moving
		sprite_index = sKatR;
		
		image_xscale = sign(hsp);
		
		with (idButterfly) {
			idButterfly.image_xscale = sign(other.hsp);
			
		}
	}
}