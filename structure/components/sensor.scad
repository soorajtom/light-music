// This is for the sensor array
// This will house all the phototransistors

module sensor_array(width,
                tab_length, tab_thickness, tab_hole_radius,
                sensor_count, sensor_spacing, sensor_radius, sensor_well_depth, sensor_brim_radius, sensor_brim_depth, sensor_padding) {

    // Calculate the total width of the sensor
    total_length = 2 * tab_length + 2 * sensor_padding + (sensor_count - 1) * sensor_spacing + 2 * sensor_radius * sensor_count;
    total_height = sensor_well_depth + sensor_brim_depth;

    // Create the sensor
    difference() {
        // Create the sensor
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

        // Create the sensor wells
        for (i = [0 : sensor_count - 1]) {
            translate([tab_length + sensor_padding + sensor_radius + i * (sensor_spacing + 2 * sensor_radius), width / 2, 0]) {
                // Create the sensor well
                cylinder(sensor_well_depth, sensor_radius);

                // Create the sensor brim
                translate([0, 0, sensor_well_depth]) {
                    cylinder(sensor_brim_depth, sensor_brim_radius);
                }
            }
        }
    }
}