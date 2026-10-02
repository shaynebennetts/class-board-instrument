#!/bin/sh
# Re-render the project-page pictures into ../images (run from tools/, Git Bash on Windows).
O="${OPENSCAD:-/c/Program Files/OpenSCAD/openscad.com}"
"$O" --preview -o ../images/assembled.png --camera=0,0,0,55,0,25,430 --autocenter --viewall --imgsize=1600,1000 render_views.scad
"$O" --preview -o ../images/exploded.png  --camera=0,0,0,62,0,28,520 --autocenter --viewall --imgsize=1600,1100 -D explode=45 render_views.scad
mkdir -p frames
for i in $(seq 0 23); do
  "$O" --preview -o "frames/f$(printf %02d $i).png" --camera=0,0,0,58,0,$(( i*15 + 25 )),440 --autocenter --viewall --imgsize=800,520 render_views.scad
done
uv run --with pillow python make_gif.py frames ../images/turntable.gif && rm -rf frames
