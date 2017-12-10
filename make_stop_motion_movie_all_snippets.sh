mkdir temp
#Copy the files and make sequential
x=0; for i in *png; do counter=$(printf %03d $x); cp "$i" temp/img"$counter".png; x=$(($x+1)); done

#Now make the movie.  Change frame rate -r, and quality -crf, as desired
ffmpeg -r 8 -f image2 -i temp/img%03d.png -vcodec libx264 -pix_fmt yuv420p zNightX.mp4

# smaller -crf is better quality, but 0 doesn't work. Just remove the -crf term.
#ffmpeg -r 8 -f image2 -i img%03d.png -vcodec libx264 -crf 10 -pix_fmt yuv420p test.mp4

# If the numbers start at anything other than 000, use this script setting the start_number appropriately
#ffmpeg -r 8 -f image2 -start_number 001 -i img%03d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4

#Make a text file with all of the items to join 
# Hardest:
# - build a big string then turn it into a file
mylist=$'#MP4 Videos to Stitch\n';for i in *mp4; do mylist+=$'file \'';mylist+="$i";mylist+="'";mylist+=$'\n';done;printf '%s' "$mylist" >> mylist.txt

# Hard:
#  - or simply append each line to the output file repeatedly until done (echo must automatically add a new line each time)
#for f in *.mp4; do echo "file '$f'" >> mylist1.txt; done

# Easy:
# - or use the capabilities of printf to loop through a directory
#printf "file '%s'\n" *.mp4 > mylist2.txt

# Now join the list of movie files into a single movie
#ffmpeg -f concat -i mylist.txt -c copy output.mp4

# Creating a movie snippet from a slide:(n.b use the same output (second -r) framerate as the other movie snippets. set the duration in the first -r)
ffmpeg -r 1/1.5 -i night2anno.png -c:v libx264 -r 8 -pix_fmt yuv420p zNight2a.mp4

