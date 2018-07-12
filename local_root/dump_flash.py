import serial

port = serial.Serial('/dev/ttyUSB0', baudrate=57600)
print("Connected!")
command = "go a1000000 read 00000000 1000000\n\r".encode()
port.write(command)

f = open("flash_dump.bin", "wb")
flag = "\n\rJOEJOEJOE\n\r".encode()
counter = 0
size = 0

while counter < 2:
    rcv = port.read(4096)
    f.write(rcv)
    size += len(rcv)
    print("size: ", hex(size))
    if flag in rcv:
        counter += 1
        print("counter + 1 ")
f.close()
print("Done! size: ",hex(counter))