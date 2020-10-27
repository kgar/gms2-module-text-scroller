# This is a mini-system

This scrolling feature is kind of a subsystem of its own. With that said, I'd like for it to be pluggable into future games with little fuss--into dialogue systems, into menu/windows systems, etc. Obviously, it'll need to be customized to the target game, but I want to focus on ease of maintenance and reusability.

## The things

- Scrollbar and thumb
  - Sprites
  - Scrollbar sprite: opportunity to save space by repeating pixels?
  - Thumb sprite: same as above
- Logic to draw scrollbar and thumb
  - Probably needs to be in an object, or at least in a function that is callable by an object
- Up/down indicators
  - Sprite(s)
  - Use the same one but flip it vertically?
- Logic to draw up/down indicators
  - Save as scrollbar and thumb; perhaps consider doing as much as possible in script functions
- Surface area for text
  - This'll probably live in an object and will have to be redone in each system where it appears.
- Logic for what text to show
  - This could be calculated in a function call
- Place to keep track of current and target scroll position
  - Needs to be in the object that is managing scrolling
- Place to lerp() or otherwise move current scroll position to target
  - This could be in a function call


