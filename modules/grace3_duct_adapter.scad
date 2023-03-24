include <../Round-Anything/polyround.scad>

module adapters() {
  Two_140mm_Fan_Adapter();
  translate([150, 0, 0]) MI50_Adapter();
}

module shroud()
{
  FAN_SILUETTE = [140, 280, 0.1];
  MI50_SILUETTE = [94.25, 25, 0.1];
  // extrude from MI50_SILUETTE to FAN_SILUETTE 
  difference()
  {
    hull() 
    {
      translate([25, 70, 240]) cube(MI50_SILUETTE);
      translate([0, 0, 0]) cube(FAN_SILUETTE);
    }
    translate([1, 1, 0]) hull() 
    {
      translate([25, 70, 240]) cube(MI50_SILUETTE - [2, 2, 0]);
      translate([0, 0, 0]) cube(FAN_SILUETTE - [2, 2, 0]);
    }
  }
}

module Two_140mm_Fan_Adapter() {
  WALL = 6;
  FAN_SILUETTE = [140, 280, 10];
  difference() 
  {
    cube(FAN_SILUETTE + [WALL, WALL, 0]);
    translate([WALL/2, WALL/2, 0]) cube(FAN_SILUETTE);
  }
}

module MI50_Adapter() {
  WALL = 2;
  MI50_SILUETTE = [94.25, 25, 20];
  MI50_NOTCH_SILUETTE = [52, 11.85, 20];
  difference() 
  {
    difference() 
    {
      cube(MI50_SILUETTE);
      translate([0, 13.15, 0]) cube(MI50_NOTCH_SILUETTE);
    }
    translate([WALL/2, WALL/2, 0]) difference() 
    {
      cube(MI50_SILUETTE - [WALL, WALL, 0]);
      translate([0, 13.15, 0] + [0, -WALL, 0]) cube(MI50_NOTCH_SILUETTE);
    }
  }
}