#Copy the files and make sequential
x=0; for i in *png; do counter=$(printf %03d $x); cp "$i" temp/img"$counter".png; x=$(($x+1)); done
