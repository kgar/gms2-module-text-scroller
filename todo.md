# To Do
- Implement Option 1: Scrollbar
  - Visualize the target scroll position in a scrollbar
    - It should set the target scroll position by a small increment, based on the height of the text
  - Add a scrollbar thumb and make it represent target scroll position
- Implement Option 2: Up/Down indicators
  - Visualize the target scroll position with up/down arrow indicators at the top/bottom right of the scrollable surface area
    - ?: Should these indicators be part of the surface or in the regular application surface?
  - When scrolling is available in a particular direction, have the indicator visualize the direction as enabled (e.g., brighter when enabled, grayed out / transparent when disabled)
- Implement basic dialogue choices in a windowed menu with scrolling
  - Use up/down arrows for this
  - The dialogue choice handler should dictate scroll position
  - The dialogue choice should support loop-back / cycling to the opposite end of the choices
- In the dialogue choices, provide an option to view a codex with some "lore"
  - When showing the codex window, use the scrollbar with thumb option
  - No loop-back; scroll should smoothly increment by line height of the text
  - Ensure holding an arrow key will commence a smooth, fast scroll

# At the end of the first draft
- Clean up the code and try to make it as maintainable as is reasonable
- Make the code as pluggable / reusable as possible so it can plug into various systems in the same game.
- Change repo name to indicate that this is a longterm holding place for this mini-system template and demo.
  
  # Research
- Think about how this code should be organized
  - How much should exist in structs? How much in scripts? How much in objects?
  - Which component is responsible for what?
- My intended coordinates are based on the GUI and not on the room coordinates. Will this be a problem in GMS2?
- Would the scroll position represent the scroll top? Scroll bottom? How do other GUIs / the web do it?
- Should these indicators be part of the surface or in the regular application surface?
- When lerping, how do I time-box the lerp so that the divide between current and target scroll position is "no greater than" a certain time while not requiring that smaller scroll distances take the full allowed time?