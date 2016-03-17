#convert -size 100x100  plasma:fractal  /tmp/bench/plasma_fractal1.jpg
#convert -size 100x100  plasma:fractal  /tmp/bench/plasma_fractal2.jpg
#convert -size 100x100  plasma:fractal  /tmp/bench/plasma_fractal3.jpg
#convert -size 160x140  plasma:fractal -blur 0x2  -swirl 180  -shave 20x20  /tmp/bench/plasma_swirl.jpg

if [ ! -d "log" ]; then
  mkdir "log"
fi
if [ ! -d "/tmp/bench" ]; then
  mkdir "/tmp/bench"
fi
echo " * Generating random image 5000x5000"
(perf stat -B convert -size 5000x5000 xc:   +noise Random   /tmp/bench/randomIMG.png ) 2> log/randomIMG.log
echo " * Applying filter on random image 5000x5000"
(perf stat -B  convert /tmp/bench/randomIMG.png -virtual-pixel tile  -blur 0x10 -auto-level  /tmp/bench/randomIMG_Blur.png ) 2> log/randomIMG_Blur.log
echo " * Generating plasma patern image 5000x5000"
(perf stat -B convert -size 5000x5000  plasma:fractal         /tmp/bench/plasmaIMG.png ) 2> log/plasmaIMG.log
echo " * Applying filter on plasma image 5000x5000"
(perf stat -B  convert /tmp/bench/plasmaIMG.png -virtual-pixel tile  -blur 0x10 -auto-level  /tmp/bench/plasmaIMG_Blur.png) 2> log/plasmaIMG_Blur.log
