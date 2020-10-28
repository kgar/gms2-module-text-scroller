if (!surface_exists(surface)) {
	surface = surface_create(surfaceWidth, surfaceHeight);
	var contentHeight = string_height_ext(textToDraw, -1, surface_get_width(surface) - 20);
	InitScrollableContentSurface(surface, contentHeight, surfaceHeight / 10, 1);
}

surface_set_target(surface);

draw_set_color(c_white);
draw_rectangle(0, 0, surfaceWidth, surfaceHeight, true);

draw_set_color(c_white);
draw_text_ext(10, 10 - surfaceScrollPosition, textToDraw, -1, surface_get_width(surface) - 10);

surface_reset_target();

draw_surface(surface, 10, 10);