#!python2

import sys
import os

with open(sys.argv[1], 'r') as r:
	with open('device.ptx.renew', 'w') as w:
		flag = False
		for line in r:
			w.write(line)
			if line.find('debug_loc') != -1:
				break

os.rename('device.ptx.renew', sys.argv[1])
