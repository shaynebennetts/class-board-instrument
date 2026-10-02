# make_gif.py FRAMES_DIR OUT.gif - assemble the turntable frames into a looping GIF
from PIL import Image
import glob, sys
fr = [Image.open(f).convert("P", palette=Image.ADAPTIVE, colors=128) for f in sorted(glob.glob(sys.argv[1] + "/f*.png"))]
fr[0].save(sys.argv[2], save_all=True, append_images=fr[1:], duration=180, loop=0, optimize=True)
print(len(fr), "frames ->", sys.argv[2])
