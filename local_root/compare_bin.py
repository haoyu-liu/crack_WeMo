
dict2 = {}

with open("380000_2.bin", 'rb') as f:
    byte = f.read(1)
    while byte != b'':
        if byte not in dict2:
            dict2[byte] = 1
        byte = f.read(1)
        
with open("380000.bin", 'rb') as f:
    byte = f.read(1)
    while byte != b'':
        if byte in dict2:
            dict2[byte]=0
        else:
            print("error: ", byte)
        byte=f.read(1)

for key, value in dict2.items():
    if value == 1:
        print(key)
        