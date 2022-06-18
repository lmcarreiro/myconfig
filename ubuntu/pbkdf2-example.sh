#!/bin/bash
# fcbklkintwttinstytbe

# Encrypt
# echo "secret" | openssl enc -e -des3 -base64 -pbkdf2

ENCRYPTED="U2FsdGVkX1+2Gdxrr/rZYJgo0g1pWDMsfTApPLUn1xLX2ZYz/sjVa8b0c2JYPnecTDwagOnV6apfZbyTjMfEt/iywxlLUmNmgXOeqD8D8Q=="

# Decrypt
echo "$ENCRYPTED" | openssl enc -d -des3 -base64 -pbkdf2
