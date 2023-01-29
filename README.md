# GPU support for MSI RTX 30xx Gaming X & Z Trio bracket

![GPU support title picture](img/gpu_stand_title_picture_30xx_600px.jpg?raw=true)

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

# Summary
This GPU support was designed to be used with anti-bending bracket which is delivered together with MSI RTX 30xx Gaming X/Z Trio. In general, the bracket does quite good anti-GPU-sagging job but depending on a PC case, it may be a bit unstable at its end (moving in horizontal plane under the weight of a GPU). It looks like these MSI brackets are not designed only for one specific GPU model but rather for a range of RTX30xx Gaming X/Z Trio GPUs  and in a result they do not really fit perfectly to every GPU. My published here model helps to increase working surface of the bracket in a place where it supports the GPU (end of the bracket). It also helps to precisely level your GPU card thanks to the thread incorporated into the design.

The support was tested only with my RTX3070 Gaming Z Trio bracket but when I watch to the following MSI's video I have a gut feeling they deliver the same anti-bending bracket with a range of 30xx Gaming Trio GPUs:

https://www.youtube.com/watch?v=a4ZdkeQ2Yjs

The bottom part total length was defined based on measurements taken in the system for which it was designed (PC case bequiet Pure Base 500DX + above mentioned GPU). If you do not have exactly the same PC case, you will have to take your own measurements and re-define value of "stand_h_total" parameter in the attached OpenSCAD generator.

You will need one M2 screw of 10-15mm length to connect the top part (hook) to the GPU bracket.

![3D model](img/gpu_stand_model_overview_500px.png?raw=true)
![Top part increasing touch surface](img/gpu_stand_end_surface_increased_600px.jpg?raw=true)
![GPU support - side view](img/gpu_stand_side_view_600px.jpg?raw=true)

This GPU stand generator requires "threads.scad" library for generating threads. You can download it e.g., using this official OpenSCAD link:

[Link to official OpenSCAD "Threads" library]([https://link-url-here.org](https://openscad.org/libraries.html#threads.scad))

# How to print

To achieve the best printing quality, the bottom part (pillar) should be printed in vertical position (standing).

If it comes to the top part (hook) I highly recommend to print it up-side-down, using 3D printed support, exactly like this:

![How to print the top part](img/gpu_stand_how_to_print_top_600px.jpg?raw=true)

---
Shield: [![CC BY-NC-SA 4.0][cc-by-nc-sa-shield]][cc-by-nc-sa]

This work is licensed under a
[Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License][cc-by-nc-sa].

[![CC BY-NC-SA 4.0][cc-by-nc-sa-image]][cc-by-nc-sa]

[cc-by-nc-sa]: http://creativecommons.org/licenses/by-nc-sa/4.0/
[cc-by-nc-sa-image]: https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png
[cc-by-nc-sa-shield]: https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg
