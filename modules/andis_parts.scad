include <../Round-Anything/polyround.scad>

module no_0()
{
    union()
    {
        n0_body();
        n0_wall();
        translate([ 0, -47, 0 ]) n0_wall();
    }
}

module n0_body()
{
    point_a = [ 23.5, 0, 1 ];
    point_b = [ 48.5, 0, 0 ];
    point_c = [ 48.5, 2, 0 ];
    point_d = [ 15.5, 2, 0 ];
    point_e = [ 5.5, 6, 0 ];
    point_f = [ 7, 7.5, 0.1 ];
    point_g = [ 0, 7.5, 0.13 ];
    point_h = [ 21, -2.3, 2 ];

    // Creating the no_0_primitive object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = 48)
    {
        polygon(polyRound([ point_a, point_b, point_c, point_d, point_e, point_f, point_g, point_h ]));
    }
}

module n0_wall()
{
    point_a = [ 23.5, 0, 1 ];
    point_b = [ 48.5, 0, 0 ];
    point_c = [ 48.5, 2, 0 ];
    point_d = [ 15.5, 2, 0 ];
    point_e = [ 12, 6, 1 ];
    point_f = [ 5.5, 6, 0 ];
    point_g = [ 7, 7.5, 0.1 ];
    point_h = [ 0, 7.5, 0.13 ];
    point_i = [ 21, -2.3, 2 ];

    // Creating the no_0_primitive object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = 1)
    {
        polygon(polyRound([ point_a, point_b, point_c, point_d, point_e, point_f, point_g, point_h, point_i ]));
    }
}