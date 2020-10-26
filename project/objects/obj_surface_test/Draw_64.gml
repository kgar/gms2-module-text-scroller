if (!surface_exists(surface)) {
	surface = surface_create(200, 50);
}

surface_set_target(surface);

draw_set_color(c_red);
draw_rectangle(25, 25, 100, 50, false);

surface_reset_target();

draw_surface(surface, 25, 25);