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

if (smoothScroll) {
	SmoothScrollTick();
}

if (mouse_check_button_pressed(mb_left)) {
	var gui_mouse_x = device_mouse_x_to_gui(0);
	var gui_mouse_y = device_mouse_y_to_gui(0);
	show_debug_message("Mouse_x" + string(gui_mouse_x));
	show_debug_message("Mouse_y" + string(gui_mouse_y));
	var buttonClicked = gui_mouse_x > smoothButtonX1 && 
		gui_mouse_x < smoothButtonX1 + smoothButtonWidth &&
		gui_mouse_y > smoothButtonY1 &&
		gui_mouse_y < smoothButtonY1 + smoothButtonHeight;
	
	if (buttonClicked) {
		smoothScroll = !smoothScroll;
	}
}