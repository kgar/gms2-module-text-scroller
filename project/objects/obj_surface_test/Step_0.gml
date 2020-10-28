if (keyboard_check_pressed(vk_up)) {
	ScrollUp();
} 
else if (keyboard_check_pressed(vk_down)) {
	ScrollDown();
}
else if (keyboard_check_pressed(vk_pageup)) {
	PageUp();
}
else if (keyboard_check_pressed(vk_pagedown)) {
	PageDown();
}