/// @description camera movement
// credit to smooth camera tutorial https://www.youtube.com/watch?v=VYgf3V6Fx3M&ab_channel=GameMakerStation-Matharoo

// get current camera position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);

//set target camera position
var targetX = oKat.x - RES_W/2;
var targetY = oKat.y - RES_H/2;

//clamp target to room bounds
targetX = clamp(targetX, 0, room_width - RES_W);
targetY = clamp(targetY, 0, room_height - RES_H);

//smoothly move camera to target position
camX = lerp(camX, targetX, CAM_SMOOTH);
camY = lerp(camY, targetY, CAM_SMOOTH);

//apply camera position
camera_set_view_pos(camera, camX, camY);


