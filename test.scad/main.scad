echo(version = version());

test = true;
// test = false;

include <ergo1.scad>
include <vars.scad>

module sec()
{
    color("red") cube(size = [ 1, 1, 1 ], center = true);
    color("green") cylinder(h = 2, r = 1, center = true);
    color("transparent") cylinder(h = 10, r = 10);
}

if (test)
{
    #color("green") translate(v = [ 0, 0, 0 ]) import("ergodone-3d-printing-case/BottomCaseLeft.stl");
    screws(x = 85, y = 0);
    $fn = 20;
    hull()
    {
#translate([ 0, 0, 0 ]) cylinder(r = 2, h = 2);
        translate([ 10, 0, 0 ]) cylinder(r = 2, h = 2);
        translate([ 15, 20, 0 ]) cylinder(r = 2, h = 2);
        translate([ 5, 10, 0 ]) cylinder(r = 2, h = 2);
    }


    //

    // l = 30; w = 40; h = 50;
    // polyhedron( // pt 0        1        2        3        4        5
    //     points = [ [ 0, 0, 0 ], [ l, 0, 0 ], [ l, w, 0 ], [ 0, w, 0 ], [ 0, w, h ], [ l, w, h ] ],
    //     faces = [ [ 0, 1, 2, 3 ], [ 5, 4, 3, 2 ], [ 0, 4, 5, 1 ], [ 0, 3, 4 ], [ 5, 2, 1 ] ]);
}
else
{
    ergo1main();
}