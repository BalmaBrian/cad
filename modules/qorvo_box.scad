include <../Round-Anything/polyround.scad>

module qorvo() 
{
    difference() {
        qorvo_box();
        translate([3, 3, 3]) qorvo_board_cut();
        translate([3, 38, 3]) qorvo_board_cut_io(); 
    }
    translate([52, 0, 0]) qorvo_lid();
}

module qorvo_board_cut() 
{
    TOLERANCE = 0.5;
    dimensions_vector = [44.2, 62.9, 11.5];
    tolerance_vector = [TOLERANCE, TOLERANCE, TOLERANCE];
    dimensions = dimensions_vector + tolerance_vector;
    cube(dimensions);
}

module qorvo_board_cut_io() {
    TOLERANCE = 0.5;
    dimensions_vector = [47.2, 18.3, 4.25];
    tolerance_vector = [TOLERANCE, TOLERANCE, TOLERANCE];
    dimensions = dimensions_vector + tolerance_vector;
    cube(dimensions);
}

module qorvo_box() {
    TOLERANCE = 6;
    dimensions_vector = [44.2, 62.9, 9];
    tolerance_vector = [TOLERANCE, TOLERANCE, TOLERANCE];
    dimensions = dimensions_vector + tolerance_vector;
    cube(dimensions);
}

module qorvo_lid() {
    difference() {
        union() 
        {
            qorvo_lid_bottom();
            translate([3, 3, 0]) qorvo_lid_top();
        }
        translate([35, 23, 0]) qorvo_lid_cut();
    }
}

module qorvo_lid_bottom() {
    TOLERANCE = 6;
    dimensions_vector = [44.2, 62.9, 0];
    tolerance_vector = [TOLERANCE, TOLERANCE, 3];
    dimensions = dimensions_vector + tolerance_vector;
    cube(dimensions);
}

module qorvo_lid_top() {
    TOLERANCE = 0;
    dimensions_vector = [44.2, 62.9, 5];
    tolerance_vector = [TOLERANCE, TOLERANCE, TOLERANCE];
    dimensions = dimensions_vector + tolerance_vector;
    cube(dimensions);
}

module qorvo_lid_cut() {
  TOLERANCE = 0.5;
    dimensions_vector = [4.8, 31, 5];
    tolerance_vector = [TOLERANCE, TOLERANCE, TOLERANCE];
    dimensions = dimensions_vector + tolerance_vector;
    cube(dimensions);
}