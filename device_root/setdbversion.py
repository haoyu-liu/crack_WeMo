#!/usr/bin/python
import sys
# if len(sys.argv) < 3:
# 	print "Error: please supply file and version"
# 	exit();

# header = 'POST /upnp/control/rules1 HTTP/1.1\r\nContent-Type: text/xml; charset="utf-8"\r\nSOAPACTION: "urn:Belkin:service:rules:1#SetRulesDBVersion"\r\nContent-Length: %d\r\nHOST: 192.168.1.143:49153\r\nUser-Agent: CyberGarage-HTTP/1.0\r\n\r\n'

# body = """<?xml version="1.0" encoding="utf-8"?>
# <s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
#  <s:Body>
#   <u:SetRulesDBVersion xmlns:u="urn:Belkin:service:rules:1">
#    <ruleDbVersion>%d</ruleDbVersion>
#    <processDb>1</processDb>
#    <ruleDbBody>&lt;![CDATA["""
# with open(sys.argv[1]) as fd:
# 	file_data = fd.read()
# 	body += base64.b64encode(file_data)

# body += """]]&gt;</ruleDbBody>
#   </u:StoreRules>
#  </s:Body>
# </s:Envelope>"""

# body = body%(int(sys.argv[2]))
# sys.stdout.write(header%(len(body))+body)


def construct_request(new_version):
	header = 'POST /upnp/control/rules1 HTTP/1.1\r\nContent-Type: text/xml; charset="utf-8"\r\nSOAPACTION: "urn:Belkin:service:rules:1#SetRulesDBVersion"\r\nContent-Length: %d\r\nHOST: 192.168.1.143:49153\r\nUser-Agent: CyberGarage-HTTP/1.0\r\n\r\n'
	body="""
	<?xml version="1.0" encoding="utf-8"?>
	<s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/" s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">
    <s:Body>
	      <u:SetRulesDBVersion xmlns:u="urn:Belkin:service:rules:1">
	         <RulesDBVersion>%d</RulesDBVersion>
	      </u:SetRulesDBVersion>
	   </s:Body>
	</s:Envelope>
	""" %new_version
	sys.stdout.write(header%(len(body))+body)

if __name__ == '__main__':
	if len(sys.argv) < 2:
		print "supply new DB version"
		exit()
	construct_request(int(sys.argv[1])+1)

