// This is for the emiiter component of the structure
// This will house all the LEDs

module led_array(width,
                tab_length, tab_thickness, anti_skew_lip_height,
                led_count, led_spacing, led_radius, led_well_depth, led_brim_radius, led_brim_depth, led_padding) {

    // Calculate the total width of the emitter
    total_length = 2 * tab_thickness + 2 * tab_length + 2 * led_padding + (led_count - 1) * led_spacing;
    total_height = led_well_depth + led_brim_depth + 2 * tab_thickness;

    // Create the emitter
    difference() {
        // Create the emitter
        cube([total_length, width, total_height]);

        // space for the paper to go in
        mouth_width = total_length - 2 * (tab_length + tab_thickness);
        translate(v = [tab_length + tab_thickness, 0, 0]) {
            cube([mouth_width, width, 2 * tab_thickness]);
        }

        // Create notches for sensor tabs
        translate(v = [tab_thickness, 0, tab_thickness]) {
            cube([tab_length, width, tab_thickness]);
        }
        translate(v = [2*tab_thickness + mouth_width, 0, tab_thickness]) {
            cube([tab_length, width, tab_thickness]);
        }



        translate([0, 0, 2 * tab_thickness]) {
            // Create the anti-skew lip
            translate([tab_length + tab_thickness, 0, 0]) {
                cube([mouth_width, width, anti_skew_lip_height]);
            }
            // Create the LED wells
            for (i = [0 : led_count - 1]) {
                translate([tab_thickness + tab_length + led_padding + i * led_spacing, width / 2, 0]) {
                    // Create the LED well
                    cylinder(h = led_well_depth, r = led_radius);

                    // Create the LED brim
                    translate([0, 0, led_well_depth]) {
                        cylinder(h = led_brim_depth, r = led_brim_radius);
                    }
                }
            }
        }
    }
}
