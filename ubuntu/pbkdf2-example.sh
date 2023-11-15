#!/bin/bash
# fcbklkintwttinstytbe

# Encrypt
# echo "secret" | openssl enc -e -des3 -base64 -pbkdf2

ENCRYPTED="U2FsdGVkX1/QWW8OzrmP3JG0oG1PwDmSFTaPpluN1X03Kd9mBDYm5816sZzAphK/ZC7/V6D6QwD0Va9Ho9rhdV9ya6VGIVZcydC815Vi4dFCDFZUVOKCMCnV3XgV7gJMoSyZ3BZWHO/KF0txSmXB003/9ztd5iMCE2lNtnlg9CsocWHCJP/8EdnRM7cw2VtLZdNSyvxXPg=="

# Decrypt
echo "$ENCRYPTED" | openssl enc -d -des3 -base64 -pbkdf2
