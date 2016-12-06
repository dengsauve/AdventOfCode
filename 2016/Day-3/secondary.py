data, counter, v_line = [], 0, []
with open("input.txt", "r") as f:
	data = f.read().splitlines()

for ii in range(0, 3):
	for i in data:
		line = list(map(int, i.split()))
		if ((data.index(i) + 1) % 3) != 0:
			v_line.append(line[ii])
		else:
			v_line.append(line[ii])
			if sorted(v_line)[0] + sorted(v_line)[1] > sorted(v_line)[2]:
				counter += 1
			v_line = []

print(counter)
