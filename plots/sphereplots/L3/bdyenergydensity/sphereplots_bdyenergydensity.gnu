#Gnuplot script to generate plot
set terminal postscript eps enhanced color font 'Helvetica,20' size 12,3.5
set border linewidth 2.0

set output 'sphereplots_bdyenergydensity.eps'
set multiplot layout 1,4 rowsfirst
set hidden3d
#set dgrid3d 65,65 qnorm 2
set palette defined ( 0 "#000090",\
                      1 "#000fff",\
                      2 "#0090ff",\
                      3 "#0fffee",\
                      4 "#90ff70",\
                      5 "#ffee00",\
                      6 "#ff7000",\
                      7 "#ee0000",\
                      8 "#7f0000")
set pm3d interpolate 0,0
#set mapping cartesian
set view equal xyz
#set size square
unset title
set key left top
#set xrange [10:54];
#set yrange [10:54];
#unset xtics
#set xtics format ""
#set xtics ("" 0.0, "" 0.0)
#unset ytics
#set ytics format ""
#set ytics ("" 0.0, "" 0.0)

#init_margins(left, right, gap, cols) = \
#  sprintf('left_margin = %f; right_margin = %f;', left, right) . \
#  sprintf('col_count = %d; gap_size = %f;', cols, gap)
#
#set_margins(col) = sprintf('set lmargin at screen %f;', get_lmargin(col)) . \
#  sprintf('set rmargin at screen %f;', get_rmargin(col));
#
#get_lmargin(col) = (left_margin + (col - 1) * (gap_size + ((right_margin - left_margin)-(col_count - 1) * gap_size)/col_count))
#
#get_rmargin(col) = (left_margin + (col - 1) * gap_size + col * ((right_margin - left_margin)-(col_count - 1) * gap_size)/col_count)
#eval(init_margins(0.02, 0.94, 0.06, 4))

set format cb "%f"
#set format cb "%.1t*10^%+03T"
#set format cb "%.1t"

#error1 = system("sed '1q;d' ascii_l2normiresallL2_z0.txt | awk '{print $2}'")
#stats 'ascii_xext_yext_zext_bdyphi1_tstep0.txt' u 4 nooutput
stats 'structgridspheresphcoordρNC_tstep0.txt' u 4 nooutput
STATSMIN1=STATS_min-0.003
STATSMAX1=STATS_max+0.006
print STATSMIN1,STATSMAX1
set cbrange [STATSMIN1:STATSMAX1]
set colorbox user origin 0.215,0.21 size 0.01,0.62
#eval(set_margins(1))
set ylabel 'x' offset 1,0 rotate by 0
set xlabel 't=0' offset 0,21
set label 1 '{/Symbol \264}10^{-1}' at screen 0.219,0.865
#if (STATSMAX1>error1) {
# splot 'ascii_xext_yext_zext_bdyphi1_tstep0_sortedblank.txt' using 1:2:3:4 with pm3d title ''
splot 'structgridspheresphcoordρNC_tstep0.txt' u 1:2:3:4 with pm3d title ''
#} else {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep1.txt' using 2:1:($3!=0?0:NaN) with pm3d title ''
#}
#plot only values larger than error1
#splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep1.txt' using 2:1:(($3 !=0)&&($3>error1) ?$3:NaN) with pm3d title ''
unset colorbox
unset cbrange
unset label 1


#error2 = system("sed '2q;d' ascii_l2normiresallL2_z0.txt | awk '{print $2}'")
#stats 'ascii_uniform_phi1_z0_L1_tstep2.txt' u 3 nooutput
#STATSMIN2=STATS_min
#STATSMAX2=STATS_max
#set cbrange [STATSMIN2:STATSMAX2]
#set colorbox user origin 0.46,0.21 size 0.01,0.62
#eval(set_margins(2))
#set ylabel 'y' offset -20,-8.6 rotate by 0
#set xlabel 't=12.5' offset 0,21
#set label 2 '{/Symbol \264}10^{-9}' at screen 0.464,0.865
#if (STATSMAX2>error2) {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep2.txt' using 2:1:($3 !=0?$3:NaN) with pm3d title ''
#} else {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep2.txt' using 2:1:($3!=0?0:NaN) with pm3d title ''
#}
#unset ylabel
#unset colorbox
#unset cbrange
#unset label 2
#
#
#error3 = system("sed '3q;d' ascii_l2normiresallL2_z0.txt | awk '{print $2}'")
#stats 'ascii_uniform_phi1_z0_L1_tstep3.txt' u 3 nooutput
#STATSMIN3=STATS_min
#STATSMAX3=STATS_max
#set cbrange [STATSMIN3:STATSMAX3]
#set colorbox user origin 0.705,0.21 size 0.01,0.62
#eval(set_margins(3))
#set label 3 '{/Symbol \264}10^{-14}' at screen 0.709,0.865
#set xlabel 't=25' offset 0,21
#if (STATSMAX3>error3) {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep3.txt' using 2:1:($3 !=0?$3:NaN) with pm3d title ''
#} else {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep3.txt' using 2:1:($3!=0?0:NaN) with pm3d title ''
#}
#unset colorbox
#unset cbrange
#unset label 3
#
#error4 = system("sed '4q;d' ascii_l2normiresallL2_z0.txt | awk '{print $2}'")
#stats 'ascii_uniform_phi1_z0_L1_tstep4.txt' u 3 nooutput
#STATSMIN4=STATS_min
#STATSMAX4=STATS_max
#set cbrange [STATSMIN4:STATSMAX4]
#set colorbox user origin 0.95,0.21 size 0.01,0.62
#eval(set_margins(4))
#set ylabel '' offset 15.5,9 rotate by 0
#set xlabel 't=37.5' offset 0,21
#set label 4 '{/Symbol \264}10^{-19}' at screen 0.954,0.865
#if (STATSMAX4>error4) {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep4.txt' using 2:1:($3 !=0?$3:NaN) with pm3d title ''
#} else {
# splot 'rectgrid_ascii_uniform_phi1_z0_L1_tstep4.txt' using 2:1:($3!=0?0:NaN) with pm3d title ''
#}
#unset colorbox
#unset cbrange
#
#unset label 4

unset multiplot
