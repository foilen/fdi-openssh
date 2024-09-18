# Description

An image with openssh server running and rsync available.

Good to use to backup files from a remote server.

It copies the files in `/config` to `/root/.ssh` and set the permissions on it.

# To test

```
./create-local-release.sh

rm -rf _test
mkdir -p _test

# Set authorized_keys
cat > _test/authorized_keys << EOF
   ssh-rsa AAAAB[...]
EOF

# Start
docker run -ti --rm -v $(pwd)/_test:/config -p 2222:22 fdi-openssh:main-SNAPSHOT

# Test ssh
ssh -o StrictHostKeyChecking=no -p 2222 root@localhost

```
