// render_views.scad - the pictures on the project page, rendered from the housing model.
// Expects class-board-2026 next to this repository (both in the same parent folder).
// In OpenSCAD a relative import() inside an included file is resolved from THIS file's folder,
// so every mesh path here is written relative to tools/.
H = "../../class-board-2026/docs/students/shaynebennetts/housing";
include <../../class-board-2026/docs/students/shaynebennetts/housing/CompleteHousing.scad>
part = "none";
explode = 0;    // mm; the exploded view uses 45
color("gold") base();
color("khaki") translate([0, 0, explode]) cover();
color("lightsteelblue") translate([0, 0, explode*0.6]) sma_plate();
color("salmon") translate([0, 0, explode*1.6]) oled_housing();
color("white") { translate([0, 0, explode]) cover_labels(); translate([0, 0, explode*0.6]) sma_labels(); }
color("darkgreen") translate([0, 0, stack]) import("../../class-board-2026/hardware/release/front-panel.stl");
color("seagreen") translate([180, 0, 0]) rotate([0, 180, 0]) import("../../class-board-2026/hardware/release/class-board.stl");
color("steelblue") multmatrix([[-1, 0, 0, dev_c[0]], [0, 0, -1, dev_c[1]], [0, -1, 0, socket_top - 3.55]])
  import(str(H, "/models/YD-ESP32-S3.stl"));
color("lightgray", 0.6) translate([0, 0, -explode*0.6]) lid();
