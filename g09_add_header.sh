here=`pwd`
echo $here

for line in `ls *.gjf`; do
        sed '1i\# opt AM1 nosymm guess=save geom=connectivity' $line > temp
	rm $line
	mv temp $line
done

for line in `ls *.gjf`; do
        chkname=`echo $line | sed 's/gjf/chk/'`;
        chkpath=`echo '%chk='$chkname`;
        sed '1i\'$chkpath $line > temp
        rm $line
        mv temp $line
done

for line in `ls *.gjf`; do
	sed '1i\%mem=1GB' $line > temp
	rm $line
	mv temp $line
done


for line in `ls *.gjf`; do
        molname=`echo $line | sed 's/'.gjf'/''/'`;
        sed '4i\\n'$molname'\n' $line > temp
        rm $line
        mv temp $line
done
