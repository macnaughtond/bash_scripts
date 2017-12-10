# Cting a movie snippet from a slide:(n.b use the same output (second -r) framerate as the other movie snippets. set the duration in the first -r)
ffmpeg -r 1/1.5 -i night2anno.png -c:v libx264 -r 8 -pix_fmt yuv420p zNight2a.mp4
