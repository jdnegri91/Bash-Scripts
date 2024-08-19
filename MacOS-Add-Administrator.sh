#!/bin/zsh
# Username and Password to create
username=""
password=""
# Create User and add to admins
dscl . -create /Users/$username IsHidden 1
dscl . -create /Users/$username UserShell /bin/zsh
dscl . -create /Users/$username RealName $username
dscl . -create /Users/$username UniqueID "510"
dscl . -create /Users/$username PrimaryGroupID 20
dscl . -create /Users/$username NFSHomeDirectory /var/$username
dscl . -passwd /Users/$username $password
dscl . -append /Groups/admin GroupMembership $username
cp -R /System/Library/User\ Template/English.lproj /var/$username
chown -R $username:staff /var/$username
sudo -u automoxsvc -i
sudo /usr/local/bin/amagent --adminuser $username --adminpass $password


