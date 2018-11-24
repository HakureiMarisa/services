#!/bin/sh

# create self-signed server certificate:

read -p "Enter your domain [www.example.com]: " DOMAIN

echo "Create server key..."

openssl genrsa -des3 -out $DOMAIN.key 2048

echo "Create server certificate signing request..."

SUBJECT="/C=US/ST=Mars/L=iTranswarp/O=iTranswarp/OU=iTranswarp/CN=$DOMAIN"

openssl req -x509 -new -nodes -subj $SUBJECT -key $DOMAIN.key -sha256 -days 3650 -out $DOMAIN.pem

echo "Remove password..."

mv $DOMAIN.key $DOMAIN.origin.key
openssl rsa -in $DOMAIN.origin.key -out $DOMAIN.key

echo "Sign SSL certificate..."

#openssl req -new -sha256 -nodes -out server.csr -newkey rsa:2048 -keyout server.key -config server.csr.cnf
#openssl x509 -req -in server.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha256 -extfile v3.ext
openssl x509 -req -sha256 -days 3650 -in $DOMAIN.csr -signkey $DOMAIN.key -out $DOMAIN.crt -extfile v3.ext

echo "TODO:"
echo "Copy $DOMAIN.crt to /etc/nginx/ssl/$DOMAIN.crt"
echo "Copy $DOMAIN.key to /etc/nginx/ssl/$DOMAIN.key"
echo "Add configuration in nginx:"
echo "server {"
echo "    ..."
echo "    listen 443 ssl;"
echo "    ssl_certificate     /etc/nginx/ssl/$DOMAIN.crt;"
echo "    ssl_certificate_key /etc/nginx/ssl/$DOMAIN.key;"
echo "}"
