from sys import argv
import requests

res = requests.get(argv[1])

for r in res.history:
    print('\nREDIRECT')
    print(f'{r.status_code} {r.reason} {r.url}')
    for (k, v) in r.headers.items():
        print(f'\t{k} : {v}')
    
print('\nRESPONSE')
print(f'{res.status_code} {res.reason} {res.url}')
for (k, v) in res.headers.items():
    print(f'\t{k} : {v}')
