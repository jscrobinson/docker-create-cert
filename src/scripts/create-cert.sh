#!/bin/bash

echo "Certificate creation"
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -passout pass:$CERT_PASS -passin pass:$CERT_PASS -subj "/C=$CERT_COUNTRY/ST=$CERT_STATE/L=$CERT_LOCALITY/O=$CERT_ORG/OU=$CERT_ORG_UNIT/CN=$CERT_COMMON_NAME/emailAddress=$CERT_EMAIL"
openssl pkcs12 -export -out cert.pfx -inkey key.pem -in cert.pem -passout pass:$CERT_PASS -passin pass:$CERT_PASS

exec "$@"