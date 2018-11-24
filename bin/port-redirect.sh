echo "==> Forwarding Ports: 80 -> 8080, 443 -> 8443 & Enabling pf"
echo "
rdr pass on lo0 inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080
rdr pass on lo0 inet proto tcp from any to any port 443 -> 127.0.0.1 port 8443
" | sudo pfctl -ef -

exit 0