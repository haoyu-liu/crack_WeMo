import requests
import sys


def zip_gen(filename):
	data = open(filename, 'rb')
	yield data.read()

def post_zip(url, filename):
	headers = {'Content-Type': "application/x-www-form-urlencoded"}
	r = requests.post(url, headers=headers, data=zip_gen(filename))

if __name__ == '__main__':
	if len(sys.argv) < 3:
		print "postfile.py <post_url> <post_file>"
		exit()
	post_zip(sys.argv[1], sys.argv[2])