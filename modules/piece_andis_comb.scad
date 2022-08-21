include <../Round-Anything/polyround.scad>

module comb_tooth(width)
{
    // On an XY plane, the following is drawn:
    //         d--------------------c
    //        /                     |
    //       /                      |
    //      a-----------------------b
    point_a = [ 0, 0, 0 ];
    point_b = [ 25.55, 0, 1 ];
    point_c = [ 25.55, 4, 0 ];
    point_d = [ 6, 4, 0 ];
    radiiPoints = [ point_a, point_b, point_c, point_d ];

    // Creating the comb_tooth object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = width)
    {
        polygon(polyRound(radiiPoints));
    }
}