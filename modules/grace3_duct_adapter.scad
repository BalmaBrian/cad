include <../Round-Anything/polyround.scad>

module adapters() {
  MI50_Adapter();
  translate([150, 0, 0]) Two_140mm_Fan_Adapter();
}

module MI50_Adapter() {
  WALL = 6;
  FAN_SILUETTE = [140, 280, 10];
  difference() 
  {
    cube(FAN_SILUETTE + [WALL, WALL, 0]);
    translate([WALL/2, WALL/2, 0]) cube(FAN_SILUETTE);
  }
}

module Two_140mm_Fan_Adapter() {
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