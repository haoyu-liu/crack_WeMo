import sys

head = """POST /upnp/control/metainfo1 HTTP/1.0\r\nContent-Type: text/xml; charset="utf-8"\r\nHOST: 10.22.22.1\r\nContent-Length: 281\r\nSOAPACTION: "urn:Belkin:service:metainfo:1#GetMetaInfo"\r\nConnection: close\r\n\r\n"""

body = """<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
   <s:Body>
      <u:GetMetaInfo xmlns:u="urn:Belkin:service:metainfo:1"></u:GetMetaInfo>
   </s:Body>
</s:Envelope>
"""

sys.stdout.write(head+body)
