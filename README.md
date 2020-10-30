# TextScroller - A GameMaker Studio 2 Module

`TextScroller` is a minuscule, reusable, pluggable module for GameMaker Studio 2. It calculates scroll position and optionally supports smooth scrolling. It is implemented via structs and meant to be used by other game systems, such as an inventory system, a dialogue system, or a menu system.

This repo also contains a simple demo that shows how to use `TextScroller` with a `surface` as a clip mask, giving the illusion of text scrolling under the edge of the textbox. The demo also showcases smooth scrolling and other typical scroll behaviors found in something like a web browser or an operation system. There is also a bare-bones implementation of a scrollbar with track, grip, and buttons.

## TextScroller Struct

`TextScroller` is a struct that manages calculations for scrolling through any content that is too wide or too tall for the content area. It includes an option to perform `smoothScroll`, which is just separating the `currentScroll` and the `targetScroll`. When using smooth scrolling, `currentScroll` is only moved toward `targetScroll` when `smooth_scroll_step()` is called during an object's step event, using linear interpolation (the lerp() function) to bridge the gap.

## ScrollbarTextScroller Struct

`ScrollbarTextScroller` is an child struct of `TextScroller` which includes calculations for a scrollbar track and grip.

The scrollbar-specific content is in a sub-struct of `TextScroller` because there are numerous cases where a game system will not need the scrollbar track or grip calculations, so including them when not needed is a bit confusing.

## Getting Started

Copy the `scr_text_scroller` contents to your project and begin using it. For examples on how to leverage a surface and smooth scrolling, check out the demo code in this repo.

## Credits

This module's scroll position logic was based almost entirely on this [excellent article on implementing a scrollbar](http://csdgn.org/article/scrollbar).

The decision to use a surface in the GUI layer was inspired by the GMS 2 teacher / YouTuber [GameMakerStation - Matharoo](https://www.youtube.com/channel/UCG9UNVaFpL0qCFUvIys1omg) and his video on [Sprite Overlay](https://www.youtube.com/watch?v=ZrvKmDpVP6I&t=73s&ab_channel=GameMakerStation-Matharoo).