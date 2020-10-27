# Surfaces in GMS
With this repo, I started to learn about GMS 2 surfaces. I was working on a dialogue system, and I wanted smooth scrolling instead of instantaneous offsetting of text. Then, I saw [this video](https://www.youtube.com/watch?v=ZrvKmDpVP6I) on surfaces.

## Surface in Draw GUI - respects viewport coordinates
Surfaces drawn upon in Draw GUI will have their coordinates line up with the current viewport. Awesome!

When doing menuing and dialogue work, being able to use surfaces will come in handy for scrolling text in and out of view smoothly... if exiting the surface area clips visibility on the text...

## Surface Clipping - It clips!
When content is drawn outside the bounds of the current surface, it clips and is not shown / drawn to the screen. That's perfect for scrolling text out of view.
