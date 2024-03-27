clear all
clc

m= 18.826; %mass
Ix= 0.0727; %mass moment
Iy=1.77; %mass moment
Iz=1.77; %mass moment
L=1.391; %length
R=0.076; %hull radius
x_fin=0.537; %fin distance from C_b
[X_g, Y_g, Z_g]=[-0.012,0,0.0048]; %location of centre of mass

X_uu = -3.11e+0; %kg/m drag
X_udot = 4.21e-1; %kg added mass
X_uw = 3.01e+1; %kg/m drag
X_uv = 3.01e-2; %kg/m drag
X_vv = -5.19e+1; %kg/m drag
X_vr = 2.72e+1; %kg/rad added mass cross term
X_ww = -5.19e+1; %kg/m drag
X_wq = -2.72e+1; %kg/rad added mass cross term
X_rr = 1.83e+0; %kg/rad added mass cross term
X_prop = 7.38e+0; %N propeller trust (bu variable diye geçiyor)
Y_uudeltar = 1.19e+1; %kg/(m.rad) fin lift force (burdaki delta aslında δ işaret tanımlarken ona dikkat et)
Y_uv = -5.85e+1; %kg/rad added mass cross-term, fin lift and drag
Y_ur = 5.66e+0; %kg/rad added mass cross-term, fin lift
Y_vv = 3.01e+0; %kg/m drag
Y_vdot = -2.72e+1; %kg added mass
Y_wp = 2.72e+1; %kg added mass cross term
Y_pq = -1.83e+0; %kg/rad added mass cross term
Y_rdot = -1.83e+0; %kg added mass
Z_uudeltas = -1.19e+1; %kg/(m.rad) fin lift force
Z_uw = -5.85e+1; %kg/rad added mass cross-term, fin lift and drag
Z_uq = -5.66e+0; %kg/rad added mass cross-term, fin lift
Z_vp = -2.72e+1; %added mass cross-term
Z_ww = 3.01e+1; %kg/m drag
Z_wdot = -2.72e+1; %kg added mass
Z_qdot = 1.83e+0; %kg added mass
Z_rp = -1.83e+0; %kg/rad added mass cross term

K_pdot = -4.10e-2; %kg.m2 /rad2  Added Mass
K_prop = -5.40e-1; %N.m Propeller Torque (variable)
K_uudeltar = 4.48e+0; %kg/rad Fin Rolling Moment
K_uudeltas = 4.48e+0; %kg/rad Fin Rolling Moment
M_uudeltas = -6.08e+0; %kg/rad  Fin Lift Moment
M_uw = 2.40e+1; %kg Body and Fin and Munk Moment
M_uq = -4.93e+0; %kg.m/rad  Added Mass Cross term and Fin Lift
M_vp = 1.83e+0; %kg.m/rad Added Mass Cross
M_wdot = 1.83e+0; %kg.m2 /rad2 Added Mass
M_qdot = -4.34e+0; %kg.m2 /rad2 Added Mass
M_rp = 4.30e+0; %kg.m2 /rad2 Added Mass Cross Term
N_uudeltar = -6.08e+0; % kg/rad Fin Lift Moment
N_uv = -2.40e+1; %kg Body and Fin and Munk Moment
N_ur = -4.93e+0; %kg.m/rad Added Mass Cross term and Fin Lift
N_vdot = -1.83e+0; %kg.m2 /rad2  Added Mass
N_wp = 1.83e+0; %kg.m /rad Added Mass Cross Term
N_pq = -4.30e+0; %kg.m2 /rad2 Added Mass Cross Term
N_rdot = -4.34e+0; % kg.m2 /rad2 Added Mass




X_ext = m*(u_dot - v*r + w*q - X_g*(q^2+r^2) + Y_g*(p*q - r_dot) + Z_g*(p*r+q_dot) );
Y_ext = m*(v_dot - w*p + u*r - Y_g*(r^2+p^2) + Z_g*(q*r - p_dot) + X_g*(q*p+r_dot) );
Z_ext = m*(w_dot - u*q + v*p - Z_g*(p^2+q^2) + X_g*(r*p - q_dot) + Y_g*(r*q+p_dot) );

K_ext = Ix*p_dot + (Ix-Iy)*q*r - m*(Y_g*(w_dot-u*q+v*p)-Z_g*(v_dot-w*p+u*r));
M_ext = Iy*q_dot + (Ix-Iz)*r*p - m*(Z_g*(u_dot-v*r+w*q)-X_g*(w_dot-u*q+v*p));
N_ext = Iz*r_dot + (Iy-Ix)*p*q - m*(X_g*(v_dot-w*p+u*r)-Y_g*(u_dot-v*r+w*q));


%hydrostatic forces

X_HS = -(W-B)*sin(theta);
Y_HS = (W-B)*cos(theta)*sin(phi);
Z_HS = (W-B)*cos(theta)*cos(phi);
K_HS = -Y_g*W*cos(theta)*cos(phi)-Z_g*W*cos(theta)*sin(phi);
M_HS = -Z_g*W*sin(theta)-X_g*W*cos(theta)*cos(phi);
N_HS = -Y_g*W*cos(theta)*sin(phi)-Z_g*W*sin(theta);

% add mass inertia forces







