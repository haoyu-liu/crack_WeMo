#!/usr/bin/env python3

import socket
import struct
import sys
from email.utils import formatdate
import scapy


def multicast_listener():
    MCAST_ADDR = "239.255.255.250"
    MCAST_PORT = 1900
    address = (MCAST_ADDR, MCAST_PORT)
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.bind(('', MCAST_PORT))

    group = socket.inet_aton(MCAST_ADDR)
    mreq = struct.pack('4sL', group, socket.INADDR_ANY)
    sock.setsockopt(socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq)

    while True:
        data, address = sock.recvfrom(4096)
        data = data.decode()
        if "Belkin" in data:
            print(address)
            sock.sendto(URL_response_generator(), address)
            print("responded.")



def URL_response_generator():
    http_response = "HTTP/1.1 200 OK\r\n" + \
        "CACHE-CONTROL: max-age=86400\r\n" + \
        "DATE: " + 'Sat, 01 Jan 2000 00:00:35 GMT's + "\r\n" + \
        "EXT:\r\n" + \
        "LOCATION: http://10.0.2.17:49153/setup.xml\r\n" + \
        'OPT: "http://schemas.upnp.org/upnp/1/0/"; ns=01\r\n' + \
        "01-NLS: 905bfa3c-1dd2-11b2-8928-fd8aebaf491c\r\n" + \
        "SERVER: Unspecified, UPnP/1.0, Unspecified\r\n" + \
        "X-User-Agent: redsonic\r\n" + \
        "ST: urn:Belkin:service:basicevent:1\r\n" +\
        "USN: uuid:Socket-1_0-221517K0101769::urn:Belkin:service:basicevent:1\r\n" + \
        "\r\n"
    return http_response.encode()


# if __name__ == "__main__":
#     multicast_listener()
