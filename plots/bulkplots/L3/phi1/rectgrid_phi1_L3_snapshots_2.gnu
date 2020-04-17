reset session
set dgrid3d 257,257 qnorm 2

set table "rectgrid_ascii_L3uniform_phi1_z0_L3_tstep1.txt"
splot 'ascii_L3uniform_phi1_z0_L3_tstep1.txt' using 2:1:3
unset table

set table "rectgrid_ascii_L3uniform_phi1_z0_L3_tstep5.txt"
splot 'ascii_L3uniform_phi1_z0_L3_tstep5.txt' using 2:1:3
unset table

set table "rectgrid_ascii_L3uniform_phi1_z0_L3_tstep6.txt"
splot 'ascii_L3uniform_phi1_z0_L3_tstep6.txt' using 2:1:3
unset table

set table "rectgrid_ascii_L3uniform_phi1_z0_L3_tstep7.txt"
splot 'ascii_L3uniform_phi1_z0_L3_tstep7.txt' using 2:1:3
unset table

unset dgrid3d
