if [ -z "$1" ];then
	echo "enter an IP address"
	exit 1
fi

IP=$1
echo "sending requests..."
echo "request setup.xml"
curl -s http://${IP}:49153/setup.xml > /dev/null
echo "request setupservice.xml"
curl -s http://${IP}:49153/setupservice.xml > /dev/null
echo "request eventservice.xml"
curl -s http://${IP}:49153/eventservice.xml > /dev/null
echo "request smartsetup.xml"
curl -s http://${IP}:49153/smartsetup.xml > /dev/null
echo "request wifi list"
python wifisetup_getlist.py | nc ${IP} 49153 > /dev/null
echo "request metainfo"
python getmetainfo.py | nc ${IP} 49153 > /dev/null