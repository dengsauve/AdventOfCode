import string
alphabet = list(string.ascii_lowercase)


def shift_cipher(text):
    # test = list("mvhkvbdib-kmjezxodgz-mvwwdo-omvdidib-837[dmvbi]"[:-7])
    test = list(text[:-7])
    # print(test)
    cipher = int("".join(test[-3:]))
    # print(cipher)
    for char in test:
        if char in alphabet:
            ii = alphabet.index(char)
            ii = (ii + cipher) % 26
            print(alphabet[ii], end="")
        elif char == "-":
            print(" ", end="")
    print(" - " + str(cipher))


def main():
    hotel = []
    with open('real.txt') as f:
        hotel = f.read().split("\n")
    for room in hotel:
        shift_cipher(room)

main()
