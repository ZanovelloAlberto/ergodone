





echo(version = version());

a = [10,10,10];
b = [a[0] -1, a[1] -1, a[2] -1, ];
echo(b);
// translate(v = [140,0,0])
// rotate(a = [0,0,0])
// import("ergodone-3d-printing-case/BottomCaseLeft.stl");

// rotate aroud a specif point
// https://stackoverflow.com/questions/45826208/openscad-rotating-around-a-particular-point
module rotate_about_pt(a, pt)
{
    translate(pt) rotate(a) translate(-pt) children();
}

module cubeholed(size) {
    cube(size);
    
}

module outer()
{
    outerWidht = 100;

    cube(size = [ 82, 100, 16 ]);

    translate(v = [ 0, -12, 0 ]) 
    rotate_about_pt([ 0, 0, -21.4 ], [ 0, 60, 0 ]) 
    cube(size = [ 51, 60, 16 ]);
}

module inner()
{
    translate(v = [ 5, 5, 6 ]) cube(size = [ 72, 90, 11 ]);

    translate(v = [ 5, 5, 6 ])
    rotate_about_pt([ 0, 0, -21.4 ], [ 0, 60, 0 ]) 
    translate(v = [ 0, 5 ,0])
    cube(size = [ 41, 50, 11 ]);

    module screws()
    {
    }
}

difference()
{
    outer();
    inner();
}