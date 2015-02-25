for fl in *.gjf; do
mv $fl $fl.old;
sed '1,4d' $fl.old > $fl;
rm -f $fl.old;
done
