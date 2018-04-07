for i in `seq 0 $N`; do
    tesseract eng.ocrb.exp$i.tif eng.ocrb.exp$i box.train
done
