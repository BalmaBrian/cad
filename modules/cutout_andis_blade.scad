module blade()
{
    // On an XY plane, the following is drawn:
    //      d-----------------------c
    //       \                      |
    //        \                     |
    //         a--------------------b
    point_a = [ 3, 0 ];
    point_b = [ 36, 0 ];
    point_c = [ 36, 4.3 ];
    point_d = [ 0, 4.3 ];

    // Creating the blade object with a rotation on the extrude
    // Object is placed on the +X -Y +Z plane
    rotate([ 90, 0, 0 ]) linear_extrude(height = 48)
    {
        polygon(points = [ point_a, point_b, point_c, point_d ]);
    }
}