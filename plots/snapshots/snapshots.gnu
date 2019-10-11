#Gnuplot script to generate plot
set terminal postscript eps enhanced color font 'Helvetica,20' size 12,3.5 
set border linewidth 2.0

set output 'snapshots.eps'
set multiplot layout 1,4 rowsfirst
set hidden3d
set dgrid3d 65,65 qnorm 2
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
set view map
unset title
set key left top
set xrange [1:64];
set yrange [1:64];
unset xtics
set xtics format ""
set xtics ("" 0.0, "" 0.0)
unset ytics
set ytics format ""
set ytics ("" 0.0, "" 0.0)
set format cb "%.0t"

init_margins(left, right, gap, cols) = \
  sprintf('left_margin = %f; right_margin = %f;', left, right) . \
  sprintf('col_count = %d; gap_size = %f;', cols, gap)

set_margins(col) = sprintf('set lmargin at screen %f;', get_lmargin(col)) . \
  sprintf('set rmargin at screen %f;', get_rmargin(col));

get_lmargin(col) = (left_margin + (col - 1) * (gap_size + ((right_margin - left_margin)-(col_count - 1) * gap_size)/col_count))

get_rmargin(col) = (left_margin + (col - 1) * gap_size + col * ((right_margin - left_margin)-(col_count - 1) * gap_size)/col_count)
eval(init_margins(0.02, 0.88, 0.02, 4))

#set colorbox user origin 0.67,0.21 size 0.01,0.62
set colorbox user origin 0.94,0.21 size 0.01,0.62
eval(set_margins(1))
set ylabel 'x' offset 1,0 rotate by 0 
set xlabel 't=0' offset 0,21
splot 'ascii_t0' using 2:1:3 with pm3d title '' 
unset colorbox

eval(set_margins(2))
set ylabel 'z' offset -16,-9.4 rotate by 0 
set xlabel 't={/Symbol p}/16' offset 0,21
splot 'ascii_t1' using 2:1:3 with pm3d title '' 
unset ylabel

eval(set_margins(3))
set ylabel '{/Symbol \264}10^{-1}' offset 72.5,9 rotate by 0 
set xlabel 't={/Symbol p}/8' offset 0,21
splot 'ascii_t2' using 2:1:3 with pm3d title ''

eval(set_margins(4))
set ylabel '' offset 15.5,9 rotate by 0 
set xlabel 't=0.5' offset 0,21
splot 'ascii_t3' using 2:1:3 with pm3d title ''
