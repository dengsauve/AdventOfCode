def room_service(text):
    sectorid, checksum, frequency, final_string = int(text.split("-")[-1].split("[")[0]), text.split("-")[-1].split("[")[1][:-1], {}, ""
    
    for letter in list("".join(text.split("-")[:-1])):
        if letter in frequency:
            frequency[letter] += 1
        else:
            frequency[letter] = 1
    
    for i in sorted(frequency.items(), key=lambda x:(-x[1],x[0]), reverse=False)[:5]:
        final_string += i[0]
    
    # print(sectorid, checksum, final_string)#Basic Logic Check
    
    return sectorid if checksum == final_string else 0


def main():
    hotel, id_sum = [], 0
    with open('input.txt') as f:
    	hotel = f.read().split("\n")
    
    for room in hotel:
        id_sum += room_service(room)
    
    print(id_sum)
    
main()
