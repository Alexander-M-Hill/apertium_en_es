declare -a sentences=("Two thousand on thermometers")


for sent in "${sentences[@]}"
do
	echo -e ${sent}$"\t\t"$(echo ${sent} | lt-proc es-en.automorf.bin |   gawk 'BEGIN{RS="$"; FS="/";}{nf=split($1,COMPONENTS,"^"); for(i = 1; i<nf; i++) printf COMPONENTS[i]; if($2 != "") printf("^%s$",$2);}' |   apertium-transfer apertium-es-en.es-en.t1x es-en.t1x.bin es-en.autobil.bin  |   lt-proc -g es-en.autogen.bin)
done
