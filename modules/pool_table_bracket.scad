include <../Round-Anything/polyround.scad>

module bracket()
{
    linear_extrude(height=11.55)
    {
        donut();
        translate([27.8,0,0]) donut();
        diamond();
    }
}

module donut()
{
    difference()
    {
        circle(r=4.9, $fn=64);
        circle(r=2.475, $fn=64);
    }
}

module diamond()
{
    radiiPoints = [
        [0, -4.9, 0],
        [0, 4.9, 0],
        [14, 7.25, 3],
        [28, 4.9, 0],
        [28, -4.9, 0],
        [14, -7.25, 3]
    ];
    difference()
    {
        polygon(polyRound(radiiPoints));
        circle(r=2.475, $fn=64);
        translate([27.8,0,0]) circle(r=2.475, $fn=64);
    }
}