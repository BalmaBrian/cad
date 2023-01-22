include <../Round-Anything/polyround.scad>

module stand(width, height, length)
{
    wall = 4;
    wall_offset = 2;
    base_width = length;
    height_offset = 10;

    point_1 = [0, 0, 0];
    point_2 = [base_width, height_offset, 1];
    point_3 = [base_width + wall_offset, height_offset + height, 1];
    point_4 = [base_width + wall_offset + wall, height_offset + height, 1]; 
    point_5 = [base_width + wall_offset + wall, height_offset, 0]; 
    point_6 = [base_width + wall_offset + wall + width, height_offset, 0];
    point_7 = [base_width + wall_offset + wall + width, height_offset + height, 1];
    point_8 = [base_width + wall_offset + wall + width + wall, height_offset + height, 1]; 
    point_9 = [base_width + wall_offset + wall + width + wall + wall_offset, height_offset, 1];
    point_10 = [base_width + wall_offset + wall + width + wall + wall_offset + base_width, 0, 0];

    linear_extrude(height = 30) polygon(polyRound([point_1, point_2, point_3, point_4, point_5, point_6, point_7, point_8, point_9, point_10]));
}