// Demo Object Members
surface = -1;
padding = 10;
textboxWidth = display_get_gui_width() * 0.75;
textboxHeight = display_get_gui_height() * 0.75;
scrollTrackWidth = 25;
scrollTrackBorderSize = 2;
textboxX1 = 10 ;// display_get_gui_width() / 2 - textboxWidth / 2;
textboxY1 = display_get_gui_height() / 2 - textboxHeight / 2;
textboxX2 = textboxX1 + textboxWidth + scrollTrackWidth + scrollTrackBorderSize * 2;
textboxY2 = textboxY1 + textboxHeight + scrollTrackBorderSize * 2;
surfaceWidth = textboxX2 - textboxX1 - padding * 2 - scrollTrackWidth - scrollTrackBorderSize * 2;
surfaceHeight = textboxY2 - textboxY1 - padding * 2 - scrollTrackBorderSize * 2;
scrollButtonWidth = scrollTrackWidth;
scrollButtonHeight = scrollTrackWidth;
trackSize = textboxHeight - scrollButtonHeight * 2 - padding * 2;
scrollTrackX1 = textboxX2 - scrollTrackWidth - scrollTrackBorderSize - padding;
scrollTrackY1 = textboxY1 + scrollTrackBorderSize + padding + scrollButtonHeight;
scrollUpButtonX1 = scrollTrackX1;
scrollUpButtonY1 = scrollTrackY1 - scrollButtonHeight;
scrollDownButtonX1 = scrollTrackX1;
scrollDownButtonY1 = scrollTrackY1 + scrollButtonHeight + trackSize;
gripWidth = scrollTrackWidth;
scrollTrackColor = make_color_rgb(240, 240, 240);
scrollButtonBg = make_color_rgb(240, 240, 240);
scrollButtonTextColor = make_color_rgb(175, 175, 175);
gripColor = make_color_rgb(175, 175, 175);
textToDraw = "Call me Ishmael. Some years ago--never mind how long precisely--having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world. It is a way I have of driving off the spleen and regulating the circulation. Whenever I find myself growing grim about the mouth; whenever it is a damp, drizzly November in my soul; whenever I find myself involuntarily pausing before coffin warehouses, and bringing up the rear of every funeral I meet; and especially whenever my hypos get such an upper hand of me, that it requires a strong moral principle to prevent me from deliberately stepping into the street, and methodically knocking people's hats off--then, I account it high time tozz get to sea as soon as I can. This is my substitute for pistol and ball. With a philosophical flourish Cato throws himself upon his sword; I quietly take to the ship. There is nothing surprising in this. If they but knew it, almost all men in their degree, some time or other, cherish very nearly the same feelings towards the ocean with me.\n\nThere now is your insular city of the Manhattoes, belted round by wharves as Indian isles by coral reefs--commerce surrounds it with her surf. Right and left, the streets take you waterward. Its extreme downtown is the battery, where that noble mole is washed by waves, and cooled by breezes, which a few hours previous were out of sight of land. Look at the crowds of water-gazers there.\n\nCircumambulate the city of a dreamy Sabbath afternoon. Go from Corlears Hook to Coenties Slip, and from thence, by Whitehall, northward. What do you see?--Posted like silent sentinels all around the town, stand thousands upon thousands of mortal men fixed in ocean reveries. Some leaning against the spiles; some seated upon the pier-heads; some looking over the bulwarks of ships from China; some high aloft in the rigging, as if striving to get a still better seaward peep. But these are all landsmen; of week days pent up in lath and plaster-- tied to counters, nailed to benches, clinched to desks. How then is this? Are the green fields gone? What do they here?";


// Demo toolbar
smoothButtonWidth = 100;
smoothButtonHeight = 50;
smoothButtonX1 = textboxX1;
smoothButtonY1 = textboxY1 - smoothButtonHeight - 10;

// Dunno where to put this, honestly; maybe it belongs in an object that manages scroll behavior
scrollHold = undefined;
keepScrolling = false;

// Text Scroller struct
textScroller = undefined;