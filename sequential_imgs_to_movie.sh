ffmpeg -r 8 -f image2 -start_number 000 -i img%03d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p test.mp4
