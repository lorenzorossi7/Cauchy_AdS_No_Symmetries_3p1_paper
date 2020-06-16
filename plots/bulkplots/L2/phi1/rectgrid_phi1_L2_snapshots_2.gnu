reset session
set dgrid3d 129,129 qnorm 2

set table "rectgrid_ascii_L2uniform_phi1_z0_L2_tstep1.txt"
splot 'ascii_L2uniform_phi1_z0_L2_tstep1.txt' using 2:1:3
unset table

set table "rectgrid_ascii_L2uniform_phi1_z0_L2_tstep5.txt"
splot 'ascii_L2uniform_phi1_z0_L2_tstep5.txt' using 2:1:3
unset table

set table "rectgrid_ascii_L2uniform_phi1_z0_L2_tstep6.txt"
splot 'ascii_L2uniform_phi1_z0_L2_tstep6.txt' using 2:1:3
unset table

set table "rectgrid_ascii_L2uniform_phi1_z0_L2_tstep7.txt"
splot 'ascii_L2uniform_phi1_z0_L2_tstep7.txt' using 2:1:3
unset table

unset dgrid3d