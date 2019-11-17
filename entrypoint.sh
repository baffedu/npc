#/bin/sh

if [ -f /etc/vm_hostname ]; then
host_name=$(cat /etc/vm_hostname)
school_name=${host_name##*-}
echo $school_name

request_url="wget -qO- ${ZEUS}/nps.php?remark=$school_name"
echo $request_url

verify_key="`$request_url`"
echo $verify_key
fi

if [ $VKEY ]; then
verify_key=$VKEY
fi

echo /npc/npc -server=${SERVERIP} -vkey=${verify_key} -type=${TYPE}
if [ -f /npc/npc ]; then
/npc/npc -server=${SERVERIP} -vkey=${verify_key} -type=${TYPE}
fi
