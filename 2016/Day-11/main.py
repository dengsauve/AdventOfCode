import pprint
import re

lab = """\
F4 .  .  .  .  .  .  .  .  .  .  .
F3 .  .  .  .  .  .  .  OG OM RG RM
F2 .  .  .  .  .  PM SM .  .  .  .
F1 E  TG TM PG SG .  .  .  .  .  .
""".splitlines()

for floor in lab:
	lab[lab.index(floor)] = floor.split()[1:]

# pprint.pprint(lab)


for floor in lab:
	if floor[0] == "E":
		matching = re.compile('(.G|.M)')
		results = list(filter(matching.match, "".join(floor)))
		print(results)


def check_floor(current_floor):
	r = re.compile(".G")
	l = list(filter(r.match, current_floor))
	for area in current_floor:
		if 'M' in area:
			if (area[0] + "G") in current_floor or not l:
				pass
			else:
				return False
	return True

# print(check_floor("F1 E  TG TM PG SG .  .  .  .  .  .".split()))
# print(check_floor("F1 E  .   TM .  .  .  .  .  .  .  .".split()))


