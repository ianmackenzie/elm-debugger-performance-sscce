This repository demonstrates a performance issue with the Elm debugger where
having large lists in the model can cause significant slowdowns (it seems that
the debugger traverses the entire list after every update). On my machine,
building and running Main.elm as a standalone (non debug mode) HTML file runs
fine (60 FPS) but running it using Elm Reactor slows down to about 8 FPS.
