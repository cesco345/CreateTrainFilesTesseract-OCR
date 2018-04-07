N=1 # set accordingly to the number of files that you have
for i in `seq 0 $N`; do
    tesseract eng.ocrb.exp$i.png eng.ocrb.exp$i batch.nochop makebox
done
