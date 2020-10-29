var currentFont = draw_get_font();
draw_set_font(fnt_book);

if (!surface_exists(surface)) {
	surface = surface_create(surfaceWidth, surfaceHeight);
	var contentHeight = string_height_ext(textToDraw, -1, surface_get_width(surface) - 20);
	var singleScrollHeight = string_height("M") / 2;
	InitScrollableContentSurface(surface, contentHeight, surfaceHeight / 10, singleScrollHeight, true);
}

draw_rectangle_color(x1, y1, x2, y2, c_gray, c_gray, c_gray, c_gray, true);

surface_set_target(surface);
draw_clear_alpha(c_white, 0);
draw_set_color(c_white);
draw_text_ext(0, 0 - surfaceScrollPosition, textToDraw, -1, surface_get_width(surface));

surface_reset_target();

draw_surface(surface, x1 + padding, y1 + padding);

draw_set_font(currentFont);

var smoothButtonColor = smoothScroll ? c_aqua : c_gray;
draw_rectangle_color(
	smoothButtonX1, 
	smoothButtonY1, 
	smoothButtonX1 + smoothButtonWidth, 
	smoothButtonY1 + smoothButtonHeight, 
	smoothButtonColor, smoothButtonColor, smoothButtonColor, smoothButtonColor, 
	!smoothScroll);

draw_set_halign(fa_center);
var valign = draw_get_valign();
draw_set_valign(fa_middle);
draw_set_color(smoothScroll ? c_black : c_gray);
draw_text(smoothButtonX1 + smoothButtonWidth / 2, 
	smoothButtonY1 + smoothButtonHeight / 2, 
	smoothScroll ? "Smooth" : "Rough");
draw_set_valign(valign);
draw_set_halign(fa_left);

draw_set_color(c_white);
var debugStats = [
	"Content size:\t" + string(contentSize),
	"Surface size:\t" + string(surfaceSize),
	"Track size:\t" + string(trackSize),
	"Grip position:\t" + string(gripPositionOnTrack),
	"Can scroll up:\t" + string(CanScrollUp()),
	"Can scroll down:\t" + string(CanScrollDown()),
];

var statX = x2 + 10;
var statY = y1;
var lineHeight = string_height("M");
var statsLength = array_length(debugStats);
for (var i = 0; i < statsLength; i++) {
	draw_text(statX, statY, debugStats[i]);
	statY += lineHeight;
}