import sys

body = """<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
   <s:Body>
      <u:GetNetworkList xmlns:u="urn:Belkin:service:WiFiSetup:1"></u:GetNetworkList>
   </s:Body>
</s:Envelope>
"""

head="""POST /upnp/control/WiFiSetup1 HTTP/1.0\r\nContent-Type: text/xml; charset="utf-8"\r\nHOST: 10.22.22.1\r\nContent-Length: 288\r\nSOAPACTION: "urn:Belkin:service:WiFiSetup:1#GetNetworkList"\r\nConnection: close\r\n\r\n"""

sys.stdout.write(head+body)