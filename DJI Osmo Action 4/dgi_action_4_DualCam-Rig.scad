// ====================================================================
// PARAMETRISCHES 80° DUAL DJI OSMO ACTION 4 RIG 
// (15° GENEIGT, BELÜFTUNGSSCHLITZE, KONISCHER LINSEN-FREIRAUM)
// ====================================================================

$fn = 64;

/* [Ansichts-Optionen] */
RENDER_MODE = "base"; // [assembly:Gesamter Zusammenbau, base:Nur Hauptgehaeuse, top:Normaler Deckel, shield:Regenschutz-Deckel, emblem:Das Trapez-Emblem]

/* [Regenschutz / Shield] */
shield_enable     = true; // Regenschutz-Deckel im Assembly generieren (ersetzt den normalen Deckel)
shield_overhang   = 8.0;  // Wie weit der Schirm an den Seiten übersteht (in mm)
shield_thickness  = 5;    // Dicke des Schirms an den Rändern (Krempe)

/* [Ladebuchse & Powerbank] */
// Öffnung für den USB-C Anschluss
charge_port_w   = 18.0;   // Breite der Öffnung
charge_port_h   = 32.0;   // Höhe der Öffnung
charge_port_y   = 4.0;    // Y-Verschiebung der Ladebuchse

// Powerbank-Halterung im vorderen V-Bereich (Horizontales Einschieben von hinten)
pb_enable       = false;   // Powerbank-Halterung aktivieren
pb_width        = 40.0;   // Breite der Powerbank (X-Achse)
pb_length       = 60.0;   // Einstecktiefe der Powerbank (Y-Achse)
pb_height       = 20.0;   // Dicke/Höhe der Powerbank (Z-Achse)
pb_wall         = 3.0;    // Wandstärke der Halterung
pb_y_offset     = -40.0;  // Position des Blocks nach VORNE (Negative Y-Achse = spitzes Ende)

/* [Emblem & Branding (Trapez auf dem Kopf)] */
emblem_w_top    = 48.0;   
emblem_w_bot    = 42.0;   
emblem_h        = 26.0;   
emblem_r        = 2.0;    
emblem_thick    = 2.0;    
emblem_recess   = 0;    
emblem_pin_dia  = 2.0;    
emblem_pin_dist = 10.0;   
emblem_pin_h    = 1.0;    
emblem_pitch_c  = 36.5;   

// --- Position Gehäuse ---
logo_base_y     = 33.0;
logo_base_z     = 15.0;

/* [Wand-Verstärkung (Front-Display)] */
inner_wall_reinforcement = 1.0; 

/* [Kamera-Abmessungen: DJI Osmo Action 4] */
cam_width       = 71.4;
cam_height      = 44.8;
cam_depth       = 29.0;
cam_clearance   = 0.6;    

/* [Rig-Geometrie & Winkel] */
rig_angle       = 80.0;   
cam_pitch       = 20.0;   
wall_thick      = 4.0;    
floor_thick     = 5;    
top_thick       = 5.0;    
base_depth      = 0;   

/* [Premium-Design] */
edge_r          = 1.2;    

/* [Ausschnitte - Base & Linsen] */
lens_dia        = 34.0;
lens_cone_dia   = 38.0;   
lens_offset_x   = 18.5;
screen_w        = 28.0;
screen_h        = 28.0;
screen_offset_x = -17.0;
button_slot_w   = 28.0;   
button_slot_h   = 34.0;   

// --- Konischer Linsen-Ausschnitt Deckel ---
top_lens_dia    = 42.0;   
top_lens_cone_d = 42.0;   
top_lens_off_x  = 21.7;   
top_lens_off_z  = 29.0;   

/* [Ausschnitte - Deckel (Top)] */
top_cutout_w_factor = 0.5;
rec_btn_dia     = 22.0;   
rec_btn_off_x   = 17.0;   
rec_btn_off_y   = 0.0;    

/* [Belüftungs-Parameter] */
vent_slot_w     = 2.5;    
vent_slot_space = 5;    

/* [Befestigung: Schrauben & Muttern] */
insert_dia      = 4.0;    
insert_depth    = 5.0;    
screw_hole_dia  = 3.5;    
screw_head_dia  = 8.0;    
screw_head_depth= 2;    

// Zentrales Loch & Stativ
center_screw_y     = 6.0;   
tripod_hole_dia    = 7.2;    
tripod_boss_top_d  = 60.0;   
tripod_boss_bot_d  = 30.0;   
tripod_boss_h      = 20.0;   

// Ohren-Löcher
insert_boss_dia = 12;   
bay_screw_y_pos = 14.0;   
bay_screw_x_out = 3.0;    


// ====================================================================
// BERECHNETE MASSE (GLOBAL)
// ====================================================================
c_w = cam_width + cam_clearance;
c_h = cam_height + cam_clearance;
c_d = cam_depth + cam_clearance;
half_angle = rig_angle / 2;

outer_w = c_w + 2 * wall_thick;
outer_d = c_d + 2 * wall_thick;
outer_h = c_h + floor_thick;

bay_screw_off_y = bay_screw_y_pos;
bay_screw_base_x = (c_w / 2) + (wall_thick / 2) + bay_screw_x_out; 


// ====================================================================
// 3D-VERRUNDUNGS-MODULE
// ====================================================================

module r_box_3d(w, d, h, r, flat_bottom=false, flat_top=false) {
    hull() {
        for (x = [w/2-r, -w/2+r]) {
            for (y = [d/2-r, -d/2+r]) {
                translate([x, y, 0]) {
                    if (flat_bottom) cylinder(r=r, h=0.001);
                    else translate([0, 0, r]) sphere(r=r);
                    
                    translate([0, 0, h])
                    if (flat_top) translate([0, 0, -0.001]) cylinder(r=r, h=0.001);
                    else translate([0, 0, -r]) sphere(r=r);
                }
            }
        }
    }
}

module rounded_cylinder(d, h, r, flat_bottom=false, flat_top=false) {
    hull() {
        if (flat_bottom) cylinder(d=d, h=0.001);
        else translate([0, 0, r]) rotate_extrude() translate([d/2 - r, 0, 0]) circle(r=r);
        
        translate([0, 0, h])
        if (flat_top) translate([0, 0, -0.001]) cylinder(d=d, h=0.001);
        else translate([0, 0, -r]) rotate_extrude() translate([d/2 - r, 0, 0]) circle(r=r);
    }
}

module bay_outer_profile(is_left, h_val, flat_bottom=false, flat_top=false) {
    bay_screw_off_x = is_left ? -bay_screw_base_x : bay_screw_base_x;
    union() {
        r_box_3d(outer_w, outer_d, h_val, edge_r, flat_bottom, flat_top);
        translate([bay_screw_off_x, bay_screw_off_y, 0])
            rounded_cylinder(d = insert_boss_dia, h = h_val, r=edge_r, flat_bottom=flat_bottom, flat_top=flat_top);
    }
}

module bay_corner(is_left, corner_x, corner_y, z_offset, h_val, r, flat_bottom=false, flat_top=false) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05;
    ty = outer_d/2;
    
    rotate([0, 0, yaw])
        rotate([-cam_pitch, 0, 0])
        translate([tx, ty, z_offset])
        translate([corner_x, corner_y, 0])
        hull() {
            if (flat_bottom) cylinder(r=r, h=0.001);
            else translate([0, 0, r]) sphere(r=r);
            
            translate([0, 0, h_val])
            if (flat_top) translate([0, 0, -0.001]) cylinder(r=r, h=0.001);
            else translate([0, 0, -r]) sphere(r=r);
        }
}

module center_fill_bridge(z_offset, h_val, flat_bottom=false, flat_top=false, is_shield=false) {
    hull() {
        bay_corner(true, outer_w/2 - edge_r, -outer_d/2 + edge_r, z_offset, h_val, edge_r, flat_bottom, flat_top);
        bay_corner(true, outer_w/2 - edge_r,  outer_d/2 - edge_r, z_offset, h_val, edge_r, flat_bottom, flat_top);
        bay_corner(false, -outer_w/2 + edge_r, -outer_d/2 + edge_r, z_offset, h_val, edge_r, flat_bottom, flat_top);
        bay_corner(false, -outer_w/2 + edge_r,  outer_d/2 - edge_r, z_offset, h_val, edge_r, flat_bottom, flat_top);
    }
    
    if (is_shield) {
        oh = shield_overhang;
        hull() {
            bay_corner(true,  (outer_w/2 - edge_r) + oh, (-outer_d/2 + edge_r) - oh, z_offset, shield_thickness, edge_r, true, false);
            bay_corner(false, (-outer_w/2 + edge_r) - oh, (-outer_d/2 + edge_r) - oh, z_offset, shield_thickness, edge_r, true, false);
            bay_corner(true,  (outer_w/2 - edge_r) + oh, (outer_d/2 - edge_r) + oh, z_offset, shield_thickness, edge_r, true, false);
            bay_corner(false, (-outer_w/2 + edge_r) - oh, (outer_d/2 - edge_r) + oh, z_offset, shield_thickness, edge_r, true, false);
        }
    }
}

module center_fill_bridge_cavity(wall, top_wall) {
    z_off = -15; 
    h_val = outer_h - top_wall - z_off;
    
    hull() {
        bay_corner(true,  outer_w/2 - edge_r + 0.1, -outer_d/2 + edge_r + wall, z_off, h_val, edge_r, true, true);
        bay_corner(true,  outer_w/2 - edge_r + 0.1,  outer_d/2 - edge_r - wall, z_off, h_val, edge_r, true, true);
        bay_corner(false, -outer_w/2 + edge_r - 0.1, -outer_d/2 + edge_r + wall, z_off, h_val, edge_r, true, true);
        bay_corner(false, -outer_w/2 + edge_r - 0.1,  outer_d/2 - edge_r - wall, z_off, h_val, edge_r, true, true);
    }
}


// ====================================================================
// MODULE: BELÜFTUNGSSCHLITZE & KAMERA-AUSSCHNITTE
// ====================================================================

module camera_lens_cutout() {
    translate([lens_offset_x + 2.1, -c_d/2 - wall_thick - 4.1, c_h/2 + 7])
        rotate([-90, 0, 0]) 
            cylinder(d1 = lens_cone_dia, d2 = lens_dia, h = wall_thick + 4.2);
}

module top_cover_lens_cutout() {
    translate([top_lens_off_x, -c_d/2 - wall_thick - 5.1, top_lens_off_z])
        rotate([-90, 0, 0]) 
            cylinder(d1 = top_lens_cone_d, d2 = top_lens_dia, h = wall_thick + 5.2);
}

module camera_ventilation_slots(is_left) {
    side_dir = is_left ? -1 : 1;
    for (z = [10 : vent_slot_space : c_h - 10]) {
        translate([side_dir * (c_w/2 + wall_thick/2), 0, z])
            cube([wall_thick + 4, c_d - 10, vent_slot_w], center=true);
    }
    for (x = [-c_w/2 + 10 : vent_slot_space : c_w/2 - 10]) {
        translate([x, 0, -floor_thick/2 + 1])
            cube([vent_slot_w, c_d - 8, floor_thick + 2.2], center=true);
    }
}

module camera_aux_cutouts() {
    camera_lens_cutout();
    
    translate([lens_offset_x + 2.1, -c_d/2 - wall_thick/2, 42])
        cube([screen_w + 6, wall_thick + 0.1, screen_h], center = true);
        
    translate([lens_offset_x + 2, -c_d/2 - wall_thick/2, 4.5])
        cube([screen_w, wall_thick + 0.1, screen_h - 21], center = true);
    
    translate([screen_offset_x, -c_d/2 - wall_thick/2, c_h/2])
        cube([screen_w, wall_thick + 6, screen_h ], center = true);
        
    translate([0, c_d/2 + wall_thick/2, c_h/2 + 2])
        cube([c_w - 6, wall_thick + 2, c_h - 13.5], center = true);
}

module camera_cutout(is_left) {
    union() {
        difference() {
            translate([-c_w/2, -c_d/2, 1]) cube([c_w, c_d, c_h + 10]);
            translate([-c_w/4, -c_d/2, c_h/2]) 
                cube([c_w/2 + 7.1, inner_wall_reinforcement * 2, c_h + 20], center=true);
        }
        camera_aux_cutouts();
        camera_ventilation_slots(is_left);
    }
}

module single_camera_bay(is_left, flat_bottom=false, flat_top=false) {
    bay_screw_off_x = is_left ? -bay_screw_base_x : bay_screw_base_x;
    
    difference() {
        bay_outer_profile(is_left, outer_h, flat_bottom, flat_top);
            
        translate([0, 0, floor_thick]) rotate([0, 0, 180]) camera_cutout(is_left);
        
        translate([bay_screw_off_x, bay_screw_off_y, outer_h - insert_depth + 0.1])
            cylinder(d = insert_dia, h = insert_depth + 1);
            
        translate([bay_screw_off_x, bay_screw_off_y, outer_h - insert_depth - 15])
            cylinder(d = screw_hole_dia, h = 15.1);
    }
}


// ====================================================================
// ZENTRALE VERSCHRAUBUNG
// ====================================================================

module central_screw_cutouts(is_top=false) {
    rotate([-cam_pitch, 0, 0]) {
        translate([0, center_screw_y, outer_h]) {
            if (is_top) {
                // Das durchgehende Schraubenloch (extrem lang nach oben)
                translate([0, 0, -20]) 
                    cylinder(d=screw_hole_dia, h=100);
                
                // Der Schacht für den Schraubenkopf
                translate([0, 0, top_thick - screw_head_depth + 0.1]) 
                    cylinder(d=screw_head_dia, h=100);
                
              
                    
            } else {
                translate([0, 0, -insert_depth + 0.1]) cylinder(d=insert_dia, h=insert_depth + 1);
                translate([0, 0, -insert_depth - 15]) cylinder(d=screw_hole_dia, h=15.1);
            }
        }
    }
}


// ====================================================================
// GLOBALE BEREINIGUNGS-MODULE
// ====================================================================

module positioned_base_cutout(is_left) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05; 
    ty = outer_d/2;
    bay_screw_off_x = is_left ? -bay_screw_base_x : bay_screw_base_x;

    rotate([0, 0, yaw]) rotate([-cam_pitch, 0, 0]) translate([tx, ty, 0])
        union() {
            translate([0, 0, floor_thick]) rotate([0, 0, 180]) camera_cutout(is_left);
            
            translate([bay_screw_off_x, bay_screw_off_y, outer_h - insert_depth + 0.1])
                cylinder(d = insert_dia, h = insert_depth + 2);
            translate([bay_screw_off_x, bay_screw_off_y, outer_h - insert_depth - 15])
                cylinder(d = screw_hole_dia, h = 15.1);
        }
}

module positioned_top_cutout(is_left) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05;
    ty = outer_d/2;
    bay_screw_off_x = is_left ? -bay_screw_base_x : bay_screw_base_x;

    rotate([0, 0, yaw]) rotate([-cam_pitch, 0, 0]) translate([tx, ty, outer_h])
        union() {
            // REC Button durchgehend + Freimachung
            translate([rec_btn_off_x, rec_btn_off_y, -1])
                cylinder(d=rec_btn_dia, h=50);
            translate([rec_btn_off_x, rec_btn_off_y, top_thick])
                cylinder(d=rec_btn_dia + 4, h=100);
                
            // Äußere Schraubenlöcher durchgehend + Freimachung
            translate([bay_screw_off_x, bay_screw_off_y, -20])
                cylinder(d=screw_hole_dia, h=100);
            translate([bay_screw_off_x, bay_screw_off_y, top_thick - screw_head_depth + 0.1])
                cylinder(d=screw_head_dia, h=100);
            translate([bay_screw_off_x, bay_screw_off_y, top_thick])
                cylinder(d=insert_boss_dia + 4, h=100);
                
            translate([0, 0, floor_thick - outer_h - 3]) 
                rotate([0, 0, 180]) 
                top_cover_lens_cutout();
        }
}

module positioned_top_cover_cavity(is_left) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05;
    ty = outer_d/2;
    
    rotate([0, 0, yaw]) rotate([-cam_pitch, 0, 0]) translate([tx, ty, 0])
        translate([0, 0, floor_thick]) rotate([0, 0, 180]) 
            difference() {
                translate([-c_w/2, -c_d/2, -10]) 
                    cube([c_w, c_d, c_h + 11.5]);
                translate([-c_w/4, -c_d/2, c_h/2]) 
                    cube([c_w/2 + 7.1, inner_wall_reinforcement * 2, c_h + 30], center=true);
            }
}

module emblem_cutout_for_base() {
    translate([0, logo_base_y, logo_base_z]) 
    rotate([90 - cam_pitch + emblem_pitch_c, 0, 180]) {
        translate([0, 0, -emblem_recess])
            rounded_trapezoid(emblem_w_top, emblem_w_bot, emblem_h, emblem_recess + 5, emblem_r, 0);
        translate([0, 0, -emblem_recess]) 
            emblem_pins();
    }
}


// ====================================================================
// MODULE: POSITIONIERUNG & BASIS (BODENPLATTE)
// ====================================================================

module positioned_bay(is_left, flat_bottom=false, flat_top=false) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05; 
    ty = outer_d/2;

    rotate([0, 0, yaw]) rotate([-cam_pitch, 0, 0]) translate([tx, ty, 0]) single_camera_bay(is_left, flat_bottom, flat_top);
}

module bay_footprint_hull(is_left) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05;
    ty = outer_d/2;

    hull() {
        rotate([0, 0, yaw]) rotate([-cam_pitch, 0, 0]) translate([tx, ty, 0])
            bay_outer_profile(is_left, edge_r*2); 
        rotate([0, 0, yaw]) translate([tx, ty, 0]) translate([0, 0, base_depth])
            bay_outer_profile(is_left, edge_r*2, flat_bottom=true);
    }
}

module main_rig_base() {
    difference() {
        union() {
            difference() {
                union() {
                    positioned_bay(true, flat_top=false);
                    positioned_bay(false, flat_top=false);

                    bay_footprint_hull(true);
                    bay_footprint_hull(false);

                    center_fill_bridge(0, outer_h , flat_top=false);

                    hull() {
                        rotate([0, 0, half_angle]) translate([-outer_w/2 + 0.05, outer_d/2, base_depth])
                            bay_outer_profile(true, 13, flat_bottom=true);
                            
                        rotate([0, 0, -half_angle]) translate([outer_w/2 - 0.05, outer_d/2, base_depth])
                            bay_outer_profile(false, 13, flat_bottom=true);
                            
                        translate([0, -12, base_depth]) rounded_cylinder(d=24, h=4, r=edge_r, flat_bottom=true);
                        translate([0, 10, base_depth]) rounded_cylinder(d=28, h=4, r=edge_r, flat_bottom=true);
                    }
                    
                    hull() {
                        translate([0, 10, base_depth]) rounded_cylinder(d=20, h=4, r=edge_r, flat_bottom=true);
                        center_fill_bridge(0, 5, flat_bottom=false); 
                    }

                    translate([0, -10, base_depth - 12.5])
                        cylinder(d1 = tripod_boss_bot_d, d2 = tripod_boss_top_d, h = tripod_boss_h  );
                }
                
                center_fill_bridge_cavity(5, 5);
                
                translate([0, -10, base_depth -30]) 
                    cylinder(d = tripod_hole_dia, h = tripod_boss_h + 12);
                
                positioned_base_cutout(true);
                positioned_base_cutout(false);
                
                emblem_cutout_for_base();
            }
            
            // Powerbank Halterung (Außenblock horizontal)
            if (pb_enable) {
                translate([0, pb_y_offset, base_depth])
                    r_box_3d(pb_width + 2*pb_wall, pb_length + 2*pb_wall, outer_h - base_depth, edge_r, flat_bottom=true, flat_top=true);
            }
        }
        
        central_screw_cutouts(false); 
        
        // Powerbank Ausschnitt (Horizontales Fach von hinten)
        if (pb_enable) {
            pb_pocket_z = base_depth + floor_thick; 
            
            // 1. Die Haupt-Tasche (Öffnung zeigt nach +Y Richtung Kameras)
            translate([0, pb_y_offset + pb_wall, pb_pocket_z + pb_height/2])
                cube([pb_width, pb_length + 2*pb_wall, pb_height], center=true);
                
            // 2. Finger-Auswurf-Loch vorne
            translate([0, pb_y_offset - pb_length/2 - pb_wall/2, pb_pocket_z + pb_height/2])
                cube([15, pb_wall + 2, pb_height - 4], center=true);
                
            // 3. Kabelkanal hinten
            translate([0, pb_y_offset + pb_length/2 - 5, pb_pocket_z + pb_height/2])
                cube([pb_width + 2*pb_wall + 10, 20, 16], center=true);
        }
    }
}


// ====================================================================
// MODULE: DURCHGEHENDER DECKEL (NORMAL ODER SHIELD)
// ====================================================================

module single_top_cover_base(is_left, flat_bottom=false, flat_top=false, is_shield=false) {
    difference() {
        union() {
            bay_outer_profile(is_left, top_thick, flat_bottom, flat_top);
            
            if (is_shield) {
                r_box_3d(outer_w + shield_overhang*2, outer_d + shield_overhang*2, shield_thickness, edge_r, flat_bottom=true, flat_top=false);
            }
        }
    }
}

module positioned_top_cover(is_left, flat_bottom=false, flat_top=false, is_shield=false) {
    yaw = is_left ? half_angle : -half_angle;
    tx = is_left ? -outer_w/2 + 0.05 : outer_w/2 - 0.05;
    ty = outer_d/2;

    rotate([0, 0, yaw]) rotate([-cam_pitch, 0, 0]) translate([tx, ty, outer_h])
        single_top_cover_base(is_left, flat_bottom, flat_top, is_shield);
}

module main_top_cover(is_shield=false) {
    difference() {
        union() {
            positioned_top_cover(true, flat_bottom=false, flat_top=false, is_shield=is_shield);
            positioned_top_cover(false, flat_bottom=false, flat_top=false, is_shield=is_shield);
            
            center_fill_bridge(outer_h, top_thick, flat_bottom=false, flat_top=false, is_shield=is_shield);
        }
        
        central_screw_cutouts(true);
        
        positioned_top_cutout(true);
        positioned_top_cutout(false);
        
        positioned_top_cover_cavity(true);
        positioned_top_cover_cavity(false);
    }
}


// ====================================================================
// MODUL: TRAPEZ-EMBLEM
// ====================================================================

module rounded_trapezoid_2d(w_top, w_bot, h_val, r) {
    hull() {
        translate([-w_top/2 + r,  h_val/2 - r]) circle(r=r);
        translate([ w_top/2 - r,  h_val/2 - r]) circle(r=r);
        translate([ w_bot/2 - r, -h_val/2 + r]) circle(r=r);
        translate([-w_bot/2 + r, -h_val/2 + r]) circle(r=r);
    }
}

module rounded_trapezoid(w_top, w_bot, h_val, thick, r, tol=0) {
    linear_extrude(height=thick) {
        if (tol > 0) {
            offset(r=-tol) rounded_trapezoid_2d(w_top, w_bot, h_val, r);
        } else {
            rounded_trapezoid_2d(w_top, w_bot, h_val, r);
        }
    }
}

module emblem_pins() {
    translate([-emblem_pin_dist/2, 0, 0]) cylinder(d=emblem_pin_dia, h=emblem_pin_h*3, center=true);
    translate([ emblem_pin_dist/2, 0, 0]) cylinder(d=emblem_pin_dia, h=emblem_pin_h*3, center=true);
}

module standalone_emblem() {
    union() {
        rounded_trapezoid(emblem_w_top, emblem_w_bot, emblem_h, emblem_thick, emblem_r, 0.2);
        
        translate([0, 0, -emblem_pin_h]) 
            translate([-emblem_pin_dist/2, 0, 0]) cylinder(d=emblem_pin_dia - 0.1, h=emblem_pin_h);
        translate([0, 0, -emblem_pin_h]) 
            translate([ emblem_pin_dist/2, 0, 0]) cylinder(d=emblem_pin_dia - 0.1, h=emblem_pin_h);
    }
}


// ====================================================================
// DARSTELLUNG
// ====================================================================

if (RENDER_MODE == "assembly") {
    color([0.25, 0.25, 0.75]) main_rig_base();
    
    if (shield_enable) {
        color([0.15, 0.25, 0.15]) translate([0, 0, 25]) main_top_cover(is_shield=true);
    } else {
        color([0.15, 0.25, 0.15]) translate([0, 0, 25]) main_top_cover(is_shield=false);
    }
    
    color([1, 0.8, 0.2]) 
        translate([0, logo_base_y, logo_base_z]) 
        rotate([90 - cam_pitch + emblem_pitch_c, 0, 180])
        translate([0, 0, -emblem_recess + 0.05 + 5])
        standalone_emblem();
} 
else if (RENDER_MODE == "base") {
    main_rig_base();
} 
else if (RENDER_MODE == "top") {
    main_top_cover(is_shield=false);
}
else if (RENDER_MODE == "shield") {
    main_top_cover(is_shield=true);
}
else if (RENDER_MODE == "emblem") {
    translate([0, 0, emblem_pin_h])
    rotate([180, 0, 0]) 
    standalone_emblem();
}