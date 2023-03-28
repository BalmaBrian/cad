include <../Round-Anything/polyround.scad>

SILHOUTTE_140_MM_FAN = [140, 140, 0];
HOLE_DISTANCE_140_MM_FAN = 124.5;
HOLE_DIAMITER_140_MM_FAN = 4.5;
FAN_HOLE_DIAMITER_140_MM_FAN = 134.2;
ADAPTER_HEIGHT_140_MM_FAN = 3;


module shroud() 
{
  bottom_fan_shroud();
  top_fan_shroud();
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