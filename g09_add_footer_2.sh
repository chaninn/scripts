here=`pwd`
echo $here

for line in `ls *.gjf`; do
        echo "--Link1--" >> $line
	echo `head -1 $line` >> $line
	echo `head -2 $line | tail -1` >> $line
	echo "# B3LYP/6-311++G(d,p) geom=checkpoint SCF=tight" >> $line
	echo `head -4 $line | tail -1` >> $line
	echo `head -5 $line | tail -1` >> $line
	echo `head -6 $line | tail -1` >> $line
	echo `head -7 $line | tail -1` >> $line
	echo `head -6 $line | tail -1` >> $line
done
