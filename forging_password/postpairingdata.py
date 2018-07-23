
import sys

head="""POST /upnp/control/smartsetup1 HTTP/1.0\r\nContent-Type: text/xml; charset="utf-8"\r\nHOST: 10.22.22.1\r\nContent-Length: %d\r\nSOAPACTION: "urn:Belkin:service:smartsetup:1#PairAndRegister"\r\nConnection: close\r\n\r\n"""

body="""<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
   <s:Body>
      <u:PairAndRegister xmlns:u="urn:Belkin:service:smartsetup:1">
         <PairingData>%s</PairingData>
         <RegistrationData>&lt;RegistrationData&gt;&lt;DeviceId&gt;13841a67af3a0fa&lt;/DeviceId&gt;&lt;DeviceName&gt;&lt;![CDATA[Motorola MotoG3]]&gt;&lt;/DeviceName&gt;&lt;smartprivateKey&gt;&lt;/smartprivateKey&gt;&lt;ReUnionKey&gt;15293252881534&lt;/ReUnionKey&gt;&lt;/RegistrationData&gt;</RegistrationData>
      </u:PairAndRegister>
   </s:Body>
</s:Envelope>
"""
pairingdata="""<PairingData><ssid><![CDATA[alfanetwork]]></ssid><auth>WPA2PSK</auth><password>a4iyNdFcvmckablbLUEEW63Tv1jUnfMPitKhWSODkXYs3SyMD53R/0vPZB6ETYEHVfhMdQDn9Asy
AvXGgiuV07NI/pVscFJ2LF8caGwy9O6Ieq/81rHud20eG4+YJlkA+VelJR4kLhQtxKy3NFlvFiru
xkgXiR59Cr+o9z/BrXXMEZlsClVFXUZv9eZwNCK3PpdhzK7o2ePVaig4wMWaJhWNFRJRAS2bmxY9
ytFfV5Y=
f0af</password><encrypt>AES</encrypt><channel>1</channel></PairingData>"""

body = body%pairingdata
head = head%len(body)
sys.stdout.write(head+body)