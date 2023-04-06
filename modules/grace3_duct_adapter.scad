include <../Round-Anything/polyround.scad>

SILHOUTTE_140_MM_FAN = [140, 140, 0];
HOLE_DISTANCE_140_MM_FAN = 124.5;
HOLE_DIAMITER_140_MM_FAN = 4.5;
FAN_HOLE_DIAMITER_140_MM_FAN = 134.2;
ADAPTER_HEIGHT_140_MM_FAN = 3;
POINTS = [
  [0,0,0], // 0
  [96.75,0,0], // 1
  [96.75,14.5,0], // 2
  [43.75,14.5,0], // 3
  [43.75,30,0], // 4
  [0,30,0], // 5
  [0,0,30], // 6
  [96.75,0,30], // 7
  [96.75,14.5,30], // 8
  [43.75,14.5,30], // 9
  [43.75,30,30], // 10
  [0,30,30] // 11
];
FACES = [
  [0,1,2,3,4,5], // bottom
  [4,5,11,10], // back 2
  [6,7,8,9,10,11], // top
  [0,1,7,6], // front
  [5,0,6,11], // left
  [1,2,8,7], // right 1
  [2,3,9,8], // back 1
  [3,4,10,9] // right 2
];


module shroud() 
{
  // bottom_fan_shroud();
  // top_fan_shroud();
  MI50_shroud();
}

module fan_adapter() 
{
  difference() 
  {
    cube(SILHOUTTE_140_MM_FAN + [0, 0, ADAPTER_HEIGHT_140_MM_FAN]);
    translate([70, 70, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
    translate([(140-HOLE_DISTANCE_140_MM_FAN)/2, (140-HOLE_DISTANCE_140_MM_FAN)/2, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = HOLE_DIAMITER_140_MM_FAN, $fn = 34);
    translate([(140-HOLE_DISTANCE_140_MM_FAN)/2, (140-HOLE_DISTANCE_140_MM_FAN)/2+HOLE_DISTANCE_140_MM_FAN, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = HOLE_DIAMITER_140_MM_FAN, $fn = 34);
    translate([(140-HOLE_DISTANCE_140_MM_FAN)/2+HOLE_DISTANCE_140_MM_FAN, (140-HOLE_DISTANCE_140_MM_FAN)/2, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = HOLE_DIAMITER_140_MM_FAN, $fn = 34);
    translate([(140-HOLE_DISTANCE_140_MM_FAN)/2+HOLE_DISTANCE_140_MM_FAN, (140-HOLE_DISTANCE_140_MM_FAN)/2+HOLE_DISTANCE_140_MM_FAN, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = HOLE_DIAMITER_140_MM_FAN, $fn = 34);
  }
}

module bottom_fan_shroud()
{
  union()
  {
    fan_adapter();
    union()
    {
      difference() 
      {
        bottom_fan_wall();
        bottom_fan_cutout();
      }
      difference() 
      {
        translate([70-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN), 110-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN), 140]) cube([(20+140-FAN_HOLE_DIAMITER_140_MM_FAN)*2, (20+140-FAN_HOLE_DIAMITER_140_MM_FAN)*2, ADAPTER_HEIGHT_140_MM_FAN]);
        translate([70, 110, 140]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20+140-FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
      }
    }
  }
}

module bottom_fan_wall()
{
  hull()
  {
    translate([70, 70, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = 140, $fn = 34);
    translate([70, 110, 140]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20+140-FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
  }
}

module bottom_fan_cutout()
{
  hull()
  {
    translate([70, 70, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
    translate([70, 110, 140]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20, $fn = 34);
  }
}

module top_fan_shroud()
{
  union() 
  {
    translate([0, 140, 0]) fan_adapter();
    union()
    {
      difference() 
      {
        top_fan_wall();
        top_fan_cutout();
      }
      translate([0, 140, 0]) difference()
      {
        translate([70-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN), 30-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN), 140]) cube([(20+140-FAN_HOLE_DIAMITER_140_MM_FAN)*2, (20+140-FAN_HOLE_DIAMITER_140_MM_FAN)*2, ADAPTER_HEIGHT_140_MM_FAN]);
        translate([70, 30, 140]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20+140-FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
      }
    }
  }
}

module top_fan_wall()
{
  translate([0, 140, 0]) hull()
  {
    translate([70, 70, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = 140, $fn = 34);
    translate([70, 30, 140]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20+140-FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
  }
}

module top_fan_cutout()
{
  translate([0, 140, 0]) hull()
  {
    translate([70, 70, 0]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, d = FAN_HOLE_DIAMITER_140_MM_FAN, $fn = 34);
    translate([70, 30, 140]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20, $fn = 34);
  }
}

module MI50_shroud()
{
  union()
  {
    translate([34.3,22.5,0]) difference()
    {
      translate([70-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN), 70+14.3, 140+ADAPTER_HEIGHT_140_MM_FAN]) fan_shroud_adapter();
      translate([70, 30+140, 140+ADAPTER_HEIGHT_140_MM_FAN]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20, $fn = 34);
      translate([70, 110, 140+ADAPTER_HEIGHT_140_MM_FAN]) cylinder(h = ADAPTER_HEIGHT_140_MM_FAN, r = 20, $fn = 34);
    }
    difference()
    {
      hull()
      {
        translate([34.3,22.5,0]) translate([70-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN), 70+14.3, 140+ADAPTER_HEIGHT_140_MM_FAN+3]) cube([51.6, 111.5, ADAPTER_HEIGHT_140_MM_FAN]);
        translate([71.5-30, 96.75, 235-33]) cube([96.75, 30, ADAPTER_HEIGHT_140_MM_FAN]);
      }
      hull()
      {
        translate([34.3,22.5,0]) translate([70-(20+140-FAN_HOLE_DIAMITER_140_MM_FAN)+1.5, 70+14.3+1.5, 140+ADAPTER_HEIGHT_140_MM_FAN+3]) cube([51.6-3, 111.5-3, ADAPTER_HEIGHT_140_MM_FAN]);
        translate([71.5-30+1.5, 96.75+1.5, 235-33]) cube([96.75-3, 30-3, ADAPTER_HEIGHT_140_MM_FAN]);
      }
      // translate([59.5, 90, 140+ADAPTER_HEIGHT_140_MM_FAN+82]) cube([47, 20, 20]);
      // polyhedron(POINTS, FACES);
    }
    difference() 
    {
      translate([71.5-30, 96.75, 235-33]) cube([96.75, 30, 35.8]);
      translate([71.5-30+1.5, 96.75+1.5, 235-33]) cube([96.75-3, 30-3, 36]);
      translate([71.5-30+42, 96.75+1.5, 235-33]) cube([53,33,36]);
    }
  }
}

module fan_shroud_adapter()
{
  cube([51.6, 111.5, ADAPTER_HEIGHT_140_MM_FAN]);
}