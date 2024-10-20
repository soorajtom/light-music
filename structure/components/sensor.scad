// This is for the sensor array
// This will house all the phototransistors

module sensor_array(width,
                tab_length, tab_thickness, anti_skew_lip_height,
                sensor_count, sensor_spacing, sensor_radius, sensor_well_depth, sensor_brim_radius, sensor_brim_depth, sensor_padding) {

    // Calculate the total width of the sensor
    total_length = 2 * tab_length + 2 * sensor_padding + (sensor_count - 1) * sensor_spacing;
    total_height = sensor_well_depth + sensor_brim_depth;

    // Create the sensor
    difference() {
        cube([total_length, width, total_height]);

        cube([tab_length, width, anti_skew_lip_height]);
        translate(v = [total_length - tab_length, 0, 0]) {
            cube([tab_length, width, anti_skew_lip_height]);
        }

        // Create the tabs
        translate([0, 0, tab_thickness + anti_skew_lip_height]) {
            cube([tab_length, width, total_height]);
        }
        translate([total_length - tab_length, 0, tab_thickness + anti_skew_lip_height]) {
            cube([tab_length, width, total_height]);
        }

        // Create the sensor wells
        for (i = [0 : sensor_count - 1]) {
            translate([tab_length + sensor_padding + i * sensor_spacing, width / 2, 0]) {
                // Create the sensor well
                cylinder(h=sensor_well_depth + anti_skew_lip_height, r=sensor_radius);

                // Create the sensor brim
                translate([0, 0, sensor_well_depth + anti_skew_lip_height]) {
                    cylinder(h=sensor_brim_depth + anti_skew_lip_height, r=sensor_brim_radius);
                }
            }
        }
    }
}
