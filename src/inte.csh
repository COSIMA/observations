#! /bin/csh -f
#
#==================================================================
# The meaning of woa13 data name: woa13_decav_sXX_04v2.nc 
# XX: 00 means annual mean, the whole depth
#     01-12 means monthly mean, only upper 1500m
#     13-16 means seasonal mean, 13 for Winter, 14 for Spring, 
#     				 15 for Summer, 16 for Autumn.
#     13-16 with the whole depth
#
# reproduce the monthly data based on seasonal data, then using
# the monthly mean data instead of data on the upper 1500m ocean.
#
# This script is doing:
# 1. extract the variable salinity 's_an' from seaonsal data 
#    to each month.
# 2. using 'ncks --mk_rec time' to add unlimited attribute of time.
# 3. rename salinity name from 's_an' to 'practical_salinity' 
# 4. using 'setup_WOA_initial_conditions.py' to processing the 
#    potential temperature.
#==================================================================
#

cd /g/data3/hh5/tmp/cosima/woa13/monthly/
echo 'extract salinity'
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s13_04v2.nc woa13_decav_ts_01_04v2.nc
ncks --mk_rec time woa13_decav_ts_01_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_01_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s13_04v2.nc woa13_decav_ts_02_04v2.nc
ncks --mk_rec time woa13_decav_ts_02_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_02_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s13_04v2.nc woa13_decav_ts_03_04v2.nc
ncks --mk_rec time woa13_decav_ts_03_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_03_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s14_04v2.nc woa13_decav_ts_04_04v2.nc
ncks --mk_rec time woa13_decav_ts_04_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_04_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s14_04v2.nc woa13_decav_ts_05_04v2.nc
ncks --mk_rec time woa13_decav_ts_05_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_05_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s14_04v2.nc woa13_decav_ts_06_04v2.nc
ncks --mk_rec time woa13_decav_ts_06_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_06_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s15_04v2.nc woa13_decav_ts_07_04v2.nc
ncks --mk_rec time woa13_decav_ts_07_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_07_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s15_04v2.nc woa13_decav_ts_08_04v2.nc
ncks --mk_rec time woa13_decav_ts_08_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_08_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s15_04v2.nc woa13_decav_ts_09_04v2.nc
ncks --mk_rec time woa13_decav_ts_09_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_09_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s16_04v2.nc woa13_decav_ts_10_04v2.nc
ncks --mk_rec time woa13_decav_ts_10_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_10_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s16_04v2.nc woa13_decav_ts_11_04v2.nc
ncks --mk_rec time woa13_decav_ts_11_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_11_04v2.nc
ncks -v s_an /g/data/v45/akm157/data/WOA13v2/averaged_decades/woa13_decav_s16_04v2.nc woa13_decav_ts_12_04v2.nc
ncks --mk_rec time woa13_decav_ts_12_04v2.nc -o test.nc
mv test.nc woa13_decav_ts_12_04v2.nc

echo 'rename salinity to practical_salinity'
@ mons =  1
@ mone =  12
@ imon = {$mons}
while ( $imon <= $mone )
echo "month = " {$imon}
ncrename -v s_an,practical_salinity /g/data3/hh5/tmp/cosima/woa13/monthly/woa13_decav_ts_`printf "%02d" {$imon}`_04v2.nc
@ imon ++
end

echo 'processing potential temperature'
time python3 setup_WOA_initial_conditions.py

