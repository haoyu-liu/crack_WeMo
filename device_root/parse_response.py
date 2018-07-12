from pyquery import PyQuery as pq
import sys

def parse(filename):
	with open(filename, 'r') as f:
		doc = pq(f.read())
	if 'path' in filename:
		data = doc('RulesDBPath').text()
		print "upload to path: %s" %data
	elif 'version' in filename:
		data = doc('RulesDBVersion').text()
		print "current DBVersion: %s" %data
	new_filename = filename[0:-9]
	with open(new_filename, 'w') as f:
		f.write(data)


if __name__ == '__main__':
	if len(sys.argv) < 2:
		print "python parse_response.py <filename>"
		exit()
	parse(sys.argv[1])