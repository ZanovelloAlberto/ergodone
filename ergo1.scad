include <vars.scad>

module ergo1main()
{
    rotate(a = [ 180, 0, 90 ]) difference()
    {
        minkowski()
        {
            outer();
            cylinder(h = 0.1, r = 1);
        }
        inner();
    }
}

module measure(y,x) {
  color("red") translate(v = [y,x,0])  cylinder(h = 200, r = 1,center =true);
}

module screws(x, y)
{
    if (test)
    {
        translate(v = [ y, x, 3 ]) cylinder(h = 3, r1 = 1.5, r2 = 3);
    }
    else
    {
        translate(v = [ y, x, -1 ]) color("green") cylinder(h = 20, r = (9 / 2) / 1.66);
        translate(v = [ y, x, -1 ]) cylinder(20, 1.5, 1.5, $fn = 6);
        translate(v = [ y, x, 3 ]) cylinder(h = 3, r1 = 1.5, r2 = 3);
        
    }
}

module outer()
{
    cube(size = [ 82, 100, 16 ]);
    translate(v = [ 0, -12, 0 ]) rotate_about_pt([ 0, 0, -21.4 ], [ 0, 60, 0 ]) cube(size = [ 51, 60, 16 ]);
}

module inner()
{
    border = 2;

    // SCREWS

    // right vertical
    screws(border, 78);
    screws(border, 35);

    // left vertical
    screws(98, 39);
    screws(98, 78);

    // horizontal
    screws(98, border);
    screws(47, border);

    // pad
    screws(-6.5, -19);
    screws(-24, 25);

    translate(v = [ 5, 5, 6 ]) cube(size = [ 76, 90, 11 ]);
    color("purple") rotate_about_pt([ 0, 0, -21.4 ], [ 0, 50, 0 ]) translate(v = [ 6, -7, 6 ])
        cube(size = [ 41, 60, 11 ]);
}