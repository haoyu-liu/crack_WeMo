#!/usr/bin/env python3
from flask import Flask, make_response, send_file
from email.utils import formatdate
import os
import threading
from udplistener import multicast_listener


app=Flask(__name__)


@app.route('/<path:path>')
def config_file(path): 
    print('path: %s' %path)
    filepath = os.getcwd() + '/device_responses/' + path
    # file not found
    # print(filepath)
    if not os.path.isfile(filepath):
        resp = make_response("<html><body><h1>404 Not Found</h1></body></html>\r\n",404)
        resp.headers['SERVER'] = 'Unspecified, UPnP/1.0, Unspecified'
        resp.headers['CONNECTION'] = 'close'
        resp.headers['CONTENT-TYPE'] ='text/html'
    # file found
    else:
        resp = make_response(send_file(filepath))
        resp.headers['CONTENT-TYPE']='text/xml'
        resp.headers['DATE'] = 'Sat, 01 Jan 2000 00:00:35 GMT'
        resp.headers['LAST-MODIFIED'] = 'Sat, 01 Jan 2000 00:00:35 GMT'
        resp.headers['SERVER'] = 'Unspecified, UPnP/1.0, Unspecified'
        resp.headers['X-User-Agent'] = 'redsonic'
        resp.headers['CONNECTION'] = 'close'
    return resp

@app.route('/ll/<path:path>')
def xss(path):
    filepath = os.getcwd() + '/ll/' + path
    print(filepath)
    return send_file(filepath)

@app.route('/upnp/control/basicevent1', methods=['POST'])
def upnp_file():
    filepath = os.getcwd()+'/device_responses'+'/upnp/control/basicevent1'
    resp = make_response(send_file(filepath))
    resp.headers['CONTENT-TYPE'] = 'text/xml; charset="utf-8"'
    resp.headers['DATE'] = 'Sat, 01 Jan 2000 00:00:35 GMT'
    resp.headers['EXT'] = ''
    resp.headers['SERVER'] = 'Unspecified, UPnP/1.0, Unspecified'
    resp.headers['X-User-Agent'] = 'redsonic'
    return resp



if __name__ == '__main__':
    try:
        ml = threading.Thread(target = multicast_listener)
        ml.start()
        print('Udp listener started')
        print('Web server is starting...')
        app.run(host='10.0.2.18', port=49152)
        
    finally:
        exit()


