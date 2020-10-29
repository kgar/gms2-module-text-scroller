if (keyboard_check_pressed(vk_up)) {
	scrollHold = vk_up;
	keepScrolling = false;
	ScrollUp();
	alarm[0] = room_speed / 2;
}
else if (keyboard_check_pressed(vk_down)) {
	scrollHold = vk_down;
	keepScrolling = false;
	ScrollDown();
	alarm[0] = room_speed / 2;
}
else if (keyboard_check_pressed(vk_pageup)) {
	scrollHold = vk_pageup;
	keepScrolling = false;
	PageUp();
	alarm[0] = room_speed / 2;
}
else if (keyboard_check_pressed(vk_pagedown)) {
	scrollHold = vk_pagedown;
	keepScrolling = false;
	PageDown();
	alarm[0] = room_speed / 2;
}
else if (keyboard_check(vk_up) && keepScrolling) {
	ScrollUp();
} 
else if (keyboard_check(vk_down) && keepScrolling) {
	ScrollDown();
}
else if (keyboard_check(vk_pageup) && keepScrolling) {
	PageUp();
}
else if (keyboard_check(vk_pagedown) && keepScrolling) {
	PageDown();
}

var released = keyboard_check_released(vk_up) || 
	keyboard_check_released(vk_down) || 
	keyboard_check_released(vk_pageup) || 
	keyboard_check_released(vk_pagedown);
	
if (released) {
	keepScrolling = false;
}

SmoothScrollTick();