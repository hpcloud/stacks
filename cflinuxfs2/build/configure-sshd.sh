set -e -x

sed -i "s/AcceptEnv /AcceptEnv HCF_* /" /etc/ssh/sshd_config

echo | tee --append /etc/ssh/sshd_config
echo "UseDNS no" | tee --append /etc/ssh/sshd_config
echo | tee --append /etc/ssh/sshd_config
