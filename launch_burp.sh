#!/bin/bash
# Created by Blake Cornell, CTO, Integris Security LLC
# Integris Security Carbonator - Beta Version - v1.1
# Released under GPL Version 2 license.
# Use at your own risk

if [[ -n $1 && -n $2 && -n $3 && -n $4 ]] #not provide enough parameters to launch carbonator
then
	SCHEME=$1
	FQDN=$2
	PORT=$3
	FOLDER=$4
	# Options allow the defining of projects and configs
	# --project-file=/path.burp
	# --config-file=/path.json
	# http://blog.portswigger.net/2016/04/introducing-burp-projects.html
	OPTIONS1=$5
	OPTIONS2=$6

	echo Launching Scan against $1://$2:$3$4
	java -jar -Xmx1024m /opt/BurpSuitePro/burpsuite_pro.jar $SCHEME $FQDN $PORT $FOLDER $OPTIONS1 $OPTIONS2
	#java -Djava.awt.headless=true -jar -Xmx1024m /opt/BurpSuitePro/burpsuite_pro.jar $SCHEME $FQDN $PORT $FOLDER $OPTIONS1 $OPTIONS2
else
	echo Usage: $0 scheme fqdn port path --project-file=PATHTOFILE --config-file=PATHTOFILE
	echo '    'Example: $0 http www.rminfosec.co.uk 80 / --project file=/<PATH> --config-file=/root/CSC/Burp/Burp-default-project.json
	echo '    Scan multiple sites: cat scheme_fqdn_port.txt | xargs -L1 '$0
fi

exit
