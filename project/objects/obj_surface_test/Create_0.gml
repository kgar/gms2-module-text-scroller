// Test surface
surface = -1;
padding = 10;
textboxWidth = display_get_gui_width() * 0.75;
textboxHeight = display_get_gui_height() * 0.75;
x1 = display_get_gui_width() / 2 - textboxWidth / 2;
y1 = display_get_gui_height() / 2 - textboxHeight / 2;
x2 = x1 + textboxWidth;
y2 = y1 + textboxHeight;
surfaceWidth = x2 - x1 - padding * 2;
surfaceHeight = y2 - y1 - padding * 2;
textToDraw = "Call me Ishmael. Some years ago--never mind how long precisely--having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet; and especially whenever my hypos get such an upper hand of me, that it requires a strong moral principle to prevent me from deliberately stepping into the street, and methodically knocking people's hats off--then, I account it high time tozz get to sea as soon as I can. This is my substitute for pistol and ball. With a philosophical flourish Cato throws himself upon his sword; I quietly take to the ship. There is nothing surprising in this. If they but knew it, almost all men in their degree, some time or other, cherish very nearly the same feelings towards the ocean with me.\n\nThere now is your insular city of the Manhattoes, belted round by wharves as Indian isles by coral reefs--commerce surrounds it with her surf. Right and left, the streets take you waterward. Its extreme downtown is the battery, where that noble mole is washed by waves, and cooled by breezes, which a few hours previous were out of sight of land. Look at the crowds of water-gazers there.\n\nCircumambulate the city of a dreamy Sabbath afternoon. Go from Corlears Hook to Coenties Slip, and from thence, by Whitehall, northward. What do you see?--Posted like silent sentinels all around the town, stand thousands upon thousands of mortal men fixed in ocean reveries. Some leaning against the spiles; some seated upon the pier-heads; some looking over the bulwarks of ships from China; some high aloft in the rigging, as if striving to get a still better seaward peep. But these are all landsmen; of week days pent up in lath and plaster-- tied to counters, nailed to benches, clinched to desks. How then is this? Are the green fields gone? What do they here?";

// Demo toolbar
smoothButtonWidth = 100;
smoothButtonHeight = 50;
smoothButtonX1 = x1;
smoothButtonY1 = y1 - smoothButtonHeight - 10;


// Dunno where to put this, honestly; maybe it belongs in an object that manages scroll behavior
scrollHold = undefined;
keepScrolling = false;

// Scrollability: Set once
contentSize = undefined;
surfaceSize = undefined;
trackSize = undefined;
surfaceContentRatio = undefined;
gripSize = undefined;
surfaceScrollAreaSize = undefined;
trackScrollAreaSize = undefined;
gripPositionOnTrack = undefined;
singleScrollUnitPixels = undefined; // Should be 1 pixel when scrolling through a page of text
pageScrollUnitPixels = undefined; // Represents 1 page of content (possibly minus a little for breathing room)
smoothScroll = false;

// Scrollability: Update on user interaction
surfaceScrollPosition = undefined;
targetScrollPosition = undefined;

// TODO: Add Mouse interaction variables?


function InitScrollableContentSurface(_surface, _contentSize, _gripSizeMin, _singleScrollUnitPixels, _smoothScroll) {
	surfaceSize = surface_get_height(_surface);
	contentSize = _contentSize;
	singleScrollUnitPixels = _singleScrollUnitPixels;
	smoothScroll = _smoothScroll;
	pageScrollUnitPixels = surfaceSize * 0.9;
	trackSize = surfaceSize; // TODO: Account for up/down arrows\
	surfaceContentRatio = surfaceSize / contentSize;
	gripSize = clamp(trackSize * surfaceContentRatio, _gripSizeMin, trackSize);
	trackScrollAreaSize = trackSize - gripSize;
	surfaceScrollAreaSize = contentSize - surfaceSize;
	SetSurfacePosition(0);// TODO: Can this be initialized to 0?
}

function SetSurfacePosition(_surfaceScrollPosition) {
	surfaceScrollPosition = _surfaceScrollPosition; 
	if (!smoothScroll || targetScrollPosition == undefined) {
		targetScrollPosition = surfaceScrollPosition;
	}
	var surfacePositionRatio = surfaceScrollPosition / surfaceScrollAreaSize;
	gripPositionOnTrack = trackScrollAreaSize * surfacePositionRatio;
}

function ScrollUp() {
	var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
	var newPosition = clamp(scrollPosition - singleScrollUnitPixels, 0, surfaceScrollAreaSize);
	if (smoothScroll) {
		targetScrollPosition = newPosition;
	} else {
		SetSurfacePosition(newPosition);
	}
	
}

function ScrollDown() {
	var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
	var newPosition = clamp(scrollPosition + singleScrollUnitPixels, 0, surfaceScrollAreaSize);
	if (smoothScroll) {
		targetScrollPosition = newPosition;
	} else {
		SetSurfacePosition(newPosition);
	}
}

function PageUp() {
	var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
	var newPosition = clamp(scrollPosition - pageScrollUnitPixels, 0, surfaceScrollAreaSize);
	if (smoothScroll) {
		targetScrollPosition = newPosition;
	} else {
		SetSurfacePosition(newPosition);
	}
}

function PageDown() {
	var scrollPosition = smoothScroll ? targetScrollPosition : surfaceScrollPosition;
	var newPosition = clamp(scrollPosition + pageScrollUnitPixels, 0, surfaceScrollAreaSize);
	if (smoothScroll) {
		targetScrollPosition = newPosition;
	} else {
		SetSurfacePosition(newPosition);
	}
}

function SmoothScrollTick() {
	if (targetScrollPosition = undefined) {
		return;
	}
	SetSurfacePosition(lerp(surfaceScrollPosition, targetScrollPosition, 0.35));
}