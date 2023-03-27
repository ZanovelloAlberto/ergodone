











// rotate aroud a specif point
// https://stackoverflow.com/questions/45826208/openscad-rotating-around-a-particular-point
module rotate_about_pt(a, pt)
{
    translate(pt) rotate(a) translate(-pt) children();
}

// outer horizontal = 166

hr = 234.5;
hl = 79;

firsthull = [
    [ hl, 99 ],
    [ hl, 83.5 ],
    [ hl, 17 ],
    [ hr, 99 ],
    [ hr, 83.5 ],
    [ hr, -27.5 ],
    [ 151, -27.5 ],
];

scondhull = [
    [ hl, 17 ],
    [ 151, -27.5 ],
    [ 36, -3 ],
    [ 42.5, -17 ],
    [ 66, -67 ],
];

// sm = firsthull++ scondhull;

screwMesure = [
    [ hl, 99 ],
    [ hl, 83.5 ],
    [ hl, 17 ],
    [ hr, 99 ],
    [ hr, 83.5 ],
    [ hr, -27.5 ],
    [ 151, -27.5 ],
    [ 36, -3 ],
    [ 42.5, -17 ],
    [ 66, -67 ],
];
for (a = screwMesure)
{
    measure(y = a[0], x = a[1]);
}

hull()
{
    for (b = firsthull)
    {
        translate(v = [ b[0], b[1], 0 ]) cylinder(h = 30, r = 10);
    }
}

hull()
{
    for (b = scondhull)
    {
        translate(v = [ b[0], b[1], 0 ]) cylinder(h = 30, r = 10);
    }
}