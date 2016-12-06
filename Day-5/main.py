import hashlib

puzzle_input = "ffykfhsq"
index = 0
counter = 0
password = ["*", "*", "*", "*", "*", "*", "*", "*"]
spots = ["0", "1", "2", "3", "4", "5", "6", "7"]

while len(spots) > 0:
    if hashlib.md5((puzzle_input+str(index)).encode('utf-8')).hexdigest()[:5] == "00000":
        if hashlib.md5((puzzle_input+str(index)).encode('utf-8')).hexdigest()[5] in spots:
            password[int(hashlib.md5((puzzle_input+str(index)).encode('utf-8')).hexdigest()[5])] = hashlib.md5((puzzle_input+str(index)).encode('utf-8')).hexdigest()[6]
            spots.pop(spots.index(hashlib.md5((puzzle_input+str(index)).encode('utf-8')).hexdigest()[5]))
            print("".join(password))
    index += 1

print(password)
