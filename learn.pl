#!/usr/bin/env perl
system "gmt begin layers png,pdf";
system "gmt basemap -JH180/15c -Rg -B0";
system "gmt grdimage \@earth_relief_10m -Cetopo1 -I+d";
system "gmt colorbar -Bxa2000f+l'Elevation (m)'";

# 绘制大圆路径
open(GMT, "| gmt plot -W1p,red") or die;
print GMT "106.7473 31.868\n";
print GMT "104.39 29.90\n";
print GMT "106.7473 31.868\n";
print GMT "13.14 52.50\n";
print GMT "106.7473 31.868\n";
print GMT "19.99 -34.52\n";
print GMT "106.7473 31.868\n";
print GMT "-77.15 38.89\n";
print GMT "106.7473 31.868\n";
print GMT "-52.47 -31.62\n";
print GMT "106.7473 31.868\n";
print GMT "150.36 -33.79\n";
print GMT "106.7473 31.868\n";
print GMT "76.22 -69.22\n";
close(GMT);

# 绘制震中位置
open(GMT, "| gmt plot -Sa0.5c -W0.5p,black,solid -Gyellow") or die;
print GMT "130.72 32.78\n";
close(GMT);

# 绘制台站位置
open(GMT, "| gmt plot -St0.2c -W0.5p,black,solid -Gblack") or die;
print GMT "104.39 29.90\n";
print GMT "13.14 52.50\n";
print GMT "19.99 -34.52\n";
print GMT "-77.15 38.89\n";
print GMT "-52.47 -31.62\n";
print GMT "150.36 -33.79\n";
print GMT "76.22 -69.22\n";
close(GMT);


# 添加文本
open (GMT, "| gmt text -F+f9p,1,black+j -Dj0.1c/0.1c") or die;
print GMT "-77.15  38.89 ML Washington\n";
print GMT "76.22  -69.22 ML Zhongshanzhan\n";
print GMT "104.39  29.90 MR Zigong\n";
print GMT "13.14   52.50 TC Berlin\n";
print GMT "19.99  -34.52 ML Bredasdorp\n";
print GMT "150.36 -33.79 ML Sydney\n";
print GMT "-52.47 -31.62 ML Pelotas\n";
close(GMT);

system "gmt end show";
