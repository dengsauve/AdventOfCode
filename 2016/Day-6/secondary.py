signal, commons = [], {}
with open("input.txt", "r") as f:
	signal = f.read().splitlines()

for i in range(0, 8):
	for word in signal:
		if word[i] in commons:
			commons[word[i]] += 1
		else:
			commons[word[i]] = 1
	print(sorted(commons.items(), key=lambda x:(x[1],x[0]), reverse=False)[0][0], end="")
	commons = {}

print("\ndone")
