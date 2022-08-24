include <../Round-Anything/polyround.scad>

module no_0()
{
    difference()
    {
        union()
        {
            n0_body();
            n0_wall();
            translate([ 0, -47, 0 ]) n0_wall();
            n0_clip_back();
            n0_clip_prisim();
        }
        n0_body_cutter();
        for (i = [1:10])
        {
            translate([ 0, i * -4.15, 0 ]) n0_tooth_cutter();
        }
    }
}

module n0_body()
{
    point_a = [ 23.5, 0, 0 ];
    point_b = [ 48.5, 0, 0 ];
    point_c = [ 48.5, 2, 0 ];
    point_d = [ 15.5, 2, 0 ];
    point_e = [ 5.5, 6, 0 ];
    point_f = [ 7, 7.5, 0.1 ];
    point_g = [ 0, 7.5, 0 ];
    point_h = [ 21, -2.3, 2 ];

    // Creating the n0_body object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = 48)
    {
        polygon(polyRound([ point_a, point_b, point_c, point_d, point_e, point_f, point_g, point_h ]));
    }
}

module n0_wall()
{
    point_a = [ 23.5, 0, 0 ];
    point_b = [ 48.5, 0, 0 ];
    point_c = [ 48.5, 2, 0 ];
    point_d = [ 15.5, 2, 0 ];
    point_e = [ 12, 6, 1 ];
    point_f = [ 5.5, 6, 0 ];
    point_g = [ 7, 7.5, 0.1 ];
    point_h = [ 0, 7.5, 0.13 ];
    point_i = [ 21, -2.3, 2 ];

    // Creating the n0_wall object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = 1)
    {
        polygon(polyRound([ point_a, point_b, point_c, point_d, point_e, point_f, point_g, point_h, point_i ]));
    }
}

module n0_tooth_cutter()
{
    point_a = [ 23.5, 0, 0 ];
    point_b = [ 23.5, -2.3, 0 ];
    point_c = [ 0, -2.3, 0 ];
    point_d = [ 0, 8, 0 ];
    point_e = [ 17.5, 8, 0 ];
    point_f = [ 15.5, 2, 0 ];
    point_g = [ 18, 0, .5 ];

    // Creating the n0_tooth_cutter object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = 2)
    {
        polygon(polyRound([ point_a, point_b, point_c, point_d, point_e, point_f, point_g ]));
    }
}

module n0_body_cutter()
{
    intersection()
    {
        difference()
        {
            translate([ 34.5, -14, -1 ]) cube([ 14, 14, 4 ]);
            translate([ 41.5, -7, -1.5 ]) cylinder(h = 6, r = 7, $fn = 64);
        }
        translate([ 41.5, -7, -1 ]) cube([ 7, 7, 4 ]);
    }
    intersection()
    {
        difference()
        {
            translate([ 34.5, -48, -1 ]) cube([ 14, 14, 4 ]);
            translate([ 41.5, -41, -1 ]) cylinder(h = 6, r = 7, $fn = 64);
        }
        translate([ 41.5, -48, -1 ]) cube([ 7, 7, 4 ]);
    }
}

module n0_clip_back()
{
    point_a = [ 48.5, 0, 0 ];
    point_b = [ 50.5, 0, 1 ];
    point_c = [ 50.5, 23, 1 ];
    point_d = [ 48.5, 23, 0 ];

    // Creating the n0_tooth_cutter object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    translate([ 0, -35, 0 ]) linear_extrude(height = 5)
    {
        polygon(polyRound([ point_a, point_b, point_c, point_d ]));
    }
}

module n0_clip_prisim()
{
    point_a = [ 50.5, 0, 0 ];
    point_b = [ 55.5, 0, .5 ];
    point_c = [ 50.5, 5, 0 ];
    difference()
    {
        translate([ 0, -15.5, 0 ]) rotate([ 90, 0, 0 ]) linear_extrude(height = 15.5)
        {
            polygon(polyRound([ point_a, point_b, point_c ]));
        }
        translate([ 53, -16.25, 3 ]) rotate([ 90, 0, 0 ]) cylinder(h = 14, r = 2, $fn = 64);
    }
}