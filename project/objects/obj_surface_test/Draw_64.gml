var currentFont = draw_get_font();
draw_set_font(fnt_book);

if (!surface_exists(surface)) {
	surface = surface_create(surfaceWidth, surfaceHeight);
	var contentHeight = string_height_ext(textToDraw, -1, surface_get_width(surface));
	var singleScrollHeight = string_height("M") / 2;
	
	if (textScroller != undefined) {
		delete textScroller;
	}
	
	textScroller = new TextScroller(surface, contentHeight, trackSize, trackSize / 10, singleScrollHeight, true);
}

// Draw textbox border
draw_rectangle_color(textboxX1, textboxY1, textboxX2, textboxY2, c_gray, c_gray, c_gray, c_gray, true);

surface_set_target(surface);
draw_clear_alpha(c_white, 0);
draw_set_color(c_white);
draw_text_ext(0, 0 - textScroller.surfaceScrollPosition, textToDraw, -1, surface_get_width(surface));

surface_reset_target();

draw_surface(surface, textboxX1 + padding, textboxY1 + padding + scrollTrackBorderSize);

// Draw Scrollbar

// Track
draw_rectangle_color(
	scrollTrackX1, 
	scrollTrackY1, 
	scrollTrackX1 + scrollTrackWidth, 
	scrollTrackY1 + textScroller.trackSize, 
	scrollTrackColor, scrollTrackColor, scrollTrackColor, scrollTrackColor, false);
	
// Draw Grip
draw_rectangle_color(
	scrollTrackX1,
	scrollTrackY1 + textScroller.gripPositionOnTrack,
	scrollTrackX1 + gripWidth,
	scrollTrackY1 + textScroller.gripPositionOnTrack + textScroller.gripSize,
	gripColor, gripColor, gripColor, gripColor, false);

// Buttons
var currentHalign = draw_get_halign();
var currentValign = draw_get_valign();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_rectangle_color(
	scrollUpButtonX1,
	scrollUpButtonY1,
	scrollUpButtonX1 + scrollButtonWidth,
	scrollUpButtonY1 + scrollButtonHeight,
	scrollButtonBg, scrollButtonBg, scrollButtonBg, scrollButtonBg, false);
	
draw_triangle_color(
	// Bottom Left
	scrollUpButtonX1 + scrollButtonWidth / 5,
	scrollUpButtonY1 + scrollButtonHeight - scrollButtonHeight / 5,
	// Bottom Right
	scrollUpButtonX1 + scrollButtonWidth - scrollButtonWidth / 5,
	scrollUpButtonY1 + scrollButtonHeight - scrollButtonHeight / 5,
	// Top center
	scrollUpButtonX1 + scrollButtonWidth / 2,
	scrollUpButtonY1 + scrollButtonHeight / 5,
	scrollButtonTextColor, scrollButtonTextColor, scrollButtonTextColor, false
);

draw_rectangle_color(
	scrollDownButtonX1,
	scrollDownButtonY1,
	scrollDownButtonX1 + scrollButtonWidth,
	scrollDownButtonY1 + scrollButtonHeight,
	scrollButtonBg, scrollButtonBg, scrollButtonBg, scrollButtonBg, false);
	
draw_triangle_color(
	// Top Left
	scrollDownButtonX1 + scrollButtonWidth / 5,
	scrollDownButtonY1 + scrollButtonHeight / 5,
	// Top Right
	scrollDownButtonX1 + scrollButtonWidth - scrollButtonWidth / 5,
	scrollDownButtonY1 + scrollButtonHeight / 5,
	// Bottom center
	scrollDownButtonX1 + scrollButtonWidth / 2,
	scrollDownButtonY1 + scrollButtonHeight - scrollButtonHeight / 5,
	scrollButtonTextColor, scrollButtonTextColor, scrollButtonTextColor, false
);

draw_set_halign(currentHalign);
draw_set_valign(currentValign);

draw_set_font(currentFont);

// Draw Options
var smoothButtonColor = textScroller.smoothScroll ? c_aqua : c_gray;
draw_rectangle_color(
	smoothButtonX1, 
	smoothButtonY1, 
	smoothButtonX1 + smoothButtonWidth, 
	smoothButtonY1 + smoothButtonHeight, 
	smoothButtonColor, smoothButtonColor, smoothButtonColor, smoothButtonColor, 
	!textScroller.smoothScroll);

draw_set_halign(fa_center);
var valign = draw_get_valign();
draw_set_valign(fa_middle);
draw_set_color(textScroller.smoothScroll ? c_black : c_gray);
draw_text(smoothButtonX1 + smoothButtonWidth / 2, 
	smoothButtonY1 + smoothButtonHeight / 2, 
	textScroller.smoothScroll ? "Smooth" : "Rough");
draw_set_valign(valign);
draw_set_halign(fa_left);

// Draw Stats
draw_set_color(c_white);
var debugStats = [
	"Content size:\t" + string(textScroller.contentSize),
	"Surface size:\t" + string(textScroller.surfaceSize),
	"Track size:\t" + string(textScroller.trackSize),
	"Grip position:\t" + string(textScroller.gripPositionOnTrack),
	"Can scroll up:\t" + string(textScroller.CanScrollUp()),
	"Can scroll down:\t" + string(textScroller.CanScrollDown()),
];

var statX = textboxX2 + 10;
var statY = textboxY1;
var lineHeight = string_height("M");
var statsLength = array_length(debugStats);
for (var i = 0; i < statsLength; i++) {
	draw_text(statX, statY, debugStats[i]);
	statY += lineHeight;
}