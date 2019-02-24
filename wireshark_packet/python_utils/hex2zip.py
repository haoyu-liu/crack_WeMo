#!/usr/bin/env python3
import sys

def main(path):
	with open(path, 'r') as f1:
		hex_data = bytes.fromhex(f1.read())
	with open('rules.zip', 'wb') as f2:
		f2.write(hex_data)
		print("done!")

if __name__ == '__main__':
	if len(sys.argv) > 1:
		main(sys.argv[1])
	else:
		print("./hex2zip.py <filepath>")