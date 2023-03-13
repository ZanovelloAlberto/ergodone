echo(version = version());

translate(v = [ 140, 0, 0 ]) import("ergodone-3d-printing-case/BottomCaseLeft.stl");

// rotate aroud a specif point
// https://stackoverflow.com/questions/45826208/openscad-rotating-around-a-particular-point
module rotate_about_pt(a, pt)
{
    translate(pt) rotate(a) translate(-pt) children();
}

module screws(x, y)
{
    translate(v = [ y, x, -1 ]) cylinder(20, 1.5, 1.5, $fn = 6);
}

// cylinder(h = 15, r1 = 9.5, r2 = 19.5, center = false);

// cylinder($fn = 0, $fa = 12, $fs = 2, h = 1, r1 = 1, r2 = 1, center = false);
module outer()
{
    cube(size = [ 82, 100, 16 ]);

    translate(v = [ 0, -12, 0 ]) rotate_about_pt([ 0, 0, -21.4 ], [ 0, 60, 0 ])

        cube(size = [ 51, 60, 16 ]);
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

    // screws(x = x, y = y);

    translate(v = [ 5, 5, 6 ]) cube(size = [ 76, 90, 11 ]);
    color("purple") rotate_about_pt([ 0, 0, -21.4 ], [ 0, 50, 0 ]) translate(v = [ 6, -7, 6 ]) cube(size = [ 41, 60, 11 ]);
}

rotate(a = [ 180, 0, 90 ]) difference()
{
    minkowski()
    {
        outer();
        // make
        cylinder(h = 0.1, r = 1);
    }
    inner();
}
// cylinder(r = 10, h = 20, $fn = 6);
// minkowski() {
//     cylinder(r = 50, h = 10);
// }

// import("test.scad");
// test();