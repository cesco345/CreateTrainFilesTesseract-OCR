function wrap {
    for i in `seq 0 $1`; do
        echo "$2$i$3"
    done
}

N=1 # Change this accordingly to number of files, that you want to feed to tesseract or export it as a script parameter.

# Uncomment this line if, you're rerunning the script
#rm pol.pffmtable  pol.shapetable pol.traineddata pol.unicharset unicharset font_properties pol.inttemp pol.normproto *.tr *.txt

for i in `seq 0 $N`; do
    tesseract eng.ocrb.exp$i.png eng.ocrb.exp$i nobatch box.train
done
unicharset_extractor `wrap $N "eng.ocrb.exp" ".box"`
echo "ocrb 0 0 1 0 0" > font_properties # tell Tesseract informations about the font
mftraining -F font_properties -U unicharset -O eng.unicharset `wrap $N "eng.ocrb.exp" ".tr"`
cntraining `wrap $N "eng.ocrb.exp" ".tr"`
# rename all files created by mftraing en cntraining, add the prefix pol.:
    mv inttemp eng.inttemp
    mv normproto eng.normproto
    mv pffmtable eng.pffmtable
    mv shapetable eng.shapetable
combine_tessdata eng.
