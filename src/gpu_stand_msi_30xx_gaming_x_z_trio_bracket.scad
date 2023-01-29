// GPU stand for MSI RTX 30xx Gaming X/Z Trio metal anti-bending bracket
// by torwan @ January 29th, 2023

// Description / Hints:
// - See also on https://www.thingiverse.com/thing:5818388
// - All dimensions in [mm].
// - Hook dimensions should work fine with original MSI anti-bending
//   bracket which is added to MSI RTX 30xx Gaming X or Z Trio GPUs.
// - The model was successfully tested only with MSI RTX 3070 Gaming
//   Z Trio GPU installed inside bequiet Pure Base 500DX PC case.
// - You will need to tune stand_h_total to fit your PC case system 
//   (take your own measurements and adjust the parameter before
//   printing the bottom part.
// - The hook (upper part) is supposed to be mounted to the GPU bracket
//   with use of M2 screw.
// - This generator requires "threads.scad" library for generating threads.
//   You can download it e.g., using this official OpenSCAD link:
//   https://openscad.org/libraries.html#threads.scad
//
// This work is licensed under a Creative Commons
// Attribution-NonCommercial-ShareAlike 4.0 International License.

use <threads.scad>  // this is mandatory (see description above)

// Main parameters
pillar_dia = 11;       // 11, make sure this is not larger than hook_width
pillar_thread_dia = 7; // 7

// Hook dimensions
hook_upper_step_off = 2.5; // 2.5, deepness of an upper step-off
hook_step_off_start = 8;   // 8, measured from the GPU bracket side
hook_width = 17;           // 17, hook width
hook_height = 17;          // 17, hook height (without thread)
hook_length_min = 3;       // 3, minimum space between the GPU bracket
                           // and the thread base (~bottom pillar sidewall) 
hook_screw_dia = 1.5;      // 1.5, for screw connecting the GPU bracket
                           // with the hook
hook_thread_l = 12;        // 12, length of the hook thread
chamfer_block = 2;         // 2, chamfer square block sidewall


// Bottom stand/pillar dimensions
stand_h_total = 78;        // 78
stand_base_dia = 35;       // 35
stand_base_h = 4;          // 4
stand_base_radius = 1;     // 1, stand base smoothing radius
stand_mid_dia = 14;        // 14, for transition between the stand base
                           // and pillar
stand_mid_h = 5;           // 5, transition end-height (measured from
                           // the bottom of the stand base
                           
// Supporting auto-calculated dimensions (do not change)
stand_thread_h = hook_thread_l * 1.5;
hook_length = hook_length_min + pillar_dia;
hook_cyl_off = (hook_width - hook_height)/2;

// Other helping parameters
$fn = 200;  // min. 200 recommended
cc = 0.01;  // for improving a preview


// ### GENERATE THE STAND PARTS
// Call show_me module with one of the possible what_to_show values:
//  - 0 - shows an overview of the whole stand (bottom + top parts)
//  - 1 - shows only the bottom (pillar) part
//  - 2 - shows only the top (hook) part

show_me(what_to_show = 0);



// ####################################################################
// Below are the generator modules. Do not modify if not really needed.

module show_me(what_to_show = 0) {
    
    if (what_to_show == 0) {
        gpu_stand_bottom();
        
        translate([0,
                   pillar_dia/2,
                   stand_h_total
                   + hook_thread_l
                   + hook_height/2 + 3])
            rotate([0, 180, 0])
                gpu_stand_top();
    }
 
    if (what_to_show == 1) {
        gpu_stand_bottom();
    }
 
    if (what_to_show == 2) {
        gpu_stand_top();
    }
}

// GPU stand top part (hook)
module gpu_stand_top(){

    difference() {
        union() {
            // Hook root body
            rotate([90, 0, 0])
                hull() {
                    translate([-hook_cyl_off, 0, hook_length/2])
                        cylinder(d = hook_height,
                                 h = hook_length,
                                 center = true);
                    translate([+hook_cyl_off, 0, hook_length/2])
                        cylinder(d = hook_height,
                                 h = hook_length,
                                 center = true);
                }
            // Upper half of the hook body
            translate([0, -hook_length/2, -hook_height/4])
                cube([hook_width-cc,
                      hook_length-cc,
                      hook_height/2-cc],
                     center = true);  

            // Thread base
            translate([0, -pillar_dia/2, 0])
                cylinder(d = pillar_dia, h = hook_height/2);    
               
            // Thread
            translate([0, -pillar_dia/2, 0])
                ScrewThread(pillar_thread_dia,
                            hook_height/2+hook_thread_l,
                            pitch=0,
                            tooth_angle=45,
                            tolerance=0.1,
                            tip_height=0,
                            tooth_height=0,
                            tip_min_fract=0);
        }
        // Hook chamfer
        rotate([90, 0, 0])
            cylinder(d = hook_screw_dia, h = hook_length+cc);
        translate([0, -hook_length, -hook_height/2+hook_upper_step_off])
            rotate([45, 0, 0])
                cube([hook_width,
                      chamfer_block,
                      chamfer_block],
                     center = true);
        
        // Step-off cut-out
        translate([0,
                   -1.5*hook_length+hook_step_off_start,
                   hook_upper_step_off/2-hook_height/2])
            cube([hook_width,
                  hook_length,
                  hook_upper_step_off],
                 center = true);
    } // difference
}

// GPU stand bottom part (pillar with foot)
module gpu_stand_bottom(){

    // Pillar body
    translate([0, 0, 0])
        cylinder(d = pillar_dia, h = stand_h_total - stand_thread_h);
    
    // Pillar screw hole
    translate([0, 0, stand_h_total - stand_thread_h])
        ScrewHole(pillar_thread_dia,
              stand_thread_h,
              position=[0,0,0],
              rotation=[0,0,0],
              pitch=0,
              tooth_angle=45,
              tolerance=0.2,
              tooth_height=0) 
                cylinder(d = pillar_dia, h = stand_thread_h);

    difference() {  
        // Foot body
        rotate_extrude(angle = 360) 
            offset(r = stand_base_radius){ 
                translate([stand_base_radius, 0, 0])    
                    polygon([[0, -stand_base_h+stand_base_radius],
                             [stand_base_dia/2-2*stand_base_radius,
                              -stand_base_h+stand_base_radius],
                             [stand_base_dia/2-2*stand_base_radius,
                              stand_base_h-stand_base_radius],
                             [0, stand_base_h-stand_base_radius]]); 
            }
            
        // Cutting out unnecessary foot bottom half           
        translate([-stand_base_dia/2,
                   -stand_base_dia/2,
                    -stand_base_h-cc])
            cube([stand_base_dia, stand_base_dia, stand_base_h+2*cc]);  
    }

    // Smoothing transition between the base and the pillar
    rotate_extrude(angle = 360) 
        polygon([[pillar_dia/2, stand_base_h],
                 [stand_mid_dia/2, stand_base_h],
                 [pillar_dia/2, stand_mid_h]]);
}