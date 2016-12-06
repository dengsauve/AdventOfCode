data, counter = [], 0
with open("input.txt", "r") as f:
	data = f.read().splitlines()

for i in data:
	if (sorted(tuple(map(int, i.split())))[0] + sorted(tuple(map(int, i.split())))[1]) > sorted(tuple(map(int, i.split())))[2]:
		counter += 1

print(counter)
