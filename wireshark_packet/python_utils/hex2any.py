#!/usr/bin/env python3
import sys
import base64 

def main(src, dst):
	with open(src, 'r') as f1:
		hex_data = bytes.fromhex(f1.read())
	with open(dst, 'wb') as f2:
		f2.write(base64.b64decode(hex_data))
		print("done!")

if __name__ == '__main__':
	if len(sys.argv) > 2:
		main(sys.argv[1], sys.argv[2])
	else:
		print("./hex2any.py <srcfilepath> <dstfilepath>")