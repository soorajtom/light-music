// This is for the emiiter component of the structure
// This will house all the LEDs

module emitter_array(width,
                tab_length, tab_thickness, tab_hole_radius,
                led_count, led_spacing, led_radius, led_well_depth, led_brim_radius, led_brim_depth, led_padding) {

    // Calculate the total width of the emitter
    total_length = 2 * tab_length + 2 * led_padding + (led_count - 1) * led_spacing + 2 * led_radius * led_count;
    total_height = led_well_depth + led_brim_depth;

    // Create the emitter
    difference() {
        // Create the emitter
        cube([total_length, width, total_height]);

        // Create the tabs
        translate([0, 0, tab_thickness]) {
            cube([tab_length, width, total_height]);
        }
        translate([total_length - tab_length, 0, tab_thickness]) {
            cube([tab_length, width, total_height]);
        }
        // Holes for the tabs
        translate([tab_length / 2, width / 2, 0]) {
            cylinder(tab_thickness, tab_hole_radius);
        }
        translate([total_length - tab_length / 2, width / 2, 0]) {
            cylinder(tab_thickness, tab_hole_radius);
        }

        // Create the LED wells
        for (i = [0 : led_count - 1]) {
            translate([tab_length + led_padding + led_radius + i * (led_spacing + 2 * led_radius), width / 2, 0]) {
                // Create the LED well
                cylinder(led_well_depth, led_radius);

                // Create the LED brim
                translate([0, 0, led_well_depth]) {
                    cylinder(led_brim_depth, led_brim_radius);
                }
            }
        }
    }
}
