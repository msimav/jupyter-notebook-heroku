import hashlib
import getpass
import random

algorithm = 'sha256'
salt_len = 12

h = hashlib.new(algorithm)
salt = ('%0' + str(salt_len) + 'x') % random.getrandbits(4 * salt_len)
passphrase = getpass.getpass('Enter password: ')
h.update(passphrase.encode('utf-8') + salt.encode('ascii'))

print(':'.join((algorithm, salt, h.hexdigest())))
