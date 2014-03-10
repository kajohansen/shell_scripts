#
# create publickey for logging in to this system
#

# Get username and hostname, then create key and publickey
if HOSTNAME=`hostname` && USERNAME=`whoami` && mkdir /home/$USERNAME/.ssh 
then
  echo "Got hostname $HOSTNAME"
  echo "Got username $USERNAME"
  echo "/home/$USERNAME/.ssh directory created"
  if ssh-keygen -q -t rsa -b 4096 -C "Key for $USERNAME on $HOSTNAME" -f "/home/$USERNAME/.ssh/$USERNAME-$HOSTNAME"
  then
    echo "/home/$USERNAME/.ssh/superuser-$HOSTNAME created successfuly"
  else
   echo "Error creating /home/$USERNAME/.ssh/superuser-$HOSTNAME"
  fi
else
  echo "Error /home/$USERNAME/.ssh directory not created"
  exit 1
fi

# add key to authorized_keys file
if cat /home/$USERNAME/.ssh/$USERNAME-$HOSTNAME.pub  >> /home/$USERNAME/.ssh/authorized_keys
then
  echo ".ssh authorized_keys file created"
else
  echo "Error moving key to authorized_keys file"
fi
