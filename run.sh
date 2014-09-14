#!/bin/bash
chown -R murmur /data

# Set Mumble SuperUser password
if [ ! -f /data/superuser_password.txt ]
then
    echo $SUPERUSER_PASSWORD > /data/superuser_password.txt
    /murmur-static_x86-${MURMUR_VERSION}/murmur.x86 -ini /etc/murmur.ini -supw $SUPERUSER_PASSWORD
    sleep 3
    echo "################ SuperUser: $SUPERUSER_PASSWORD"
fi
/sbin/setuser murmur /murmur-static_x86-${MURMUR_VERSION}/murmur.x86 -fg -ini /etc/murmur.ini
