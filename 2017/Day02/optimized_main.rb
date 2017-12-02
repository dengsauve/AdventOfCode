# Day 02

=begin
--- Day 2: Corruption Checksum ---

As you walk through the door, a glowing humanoid shape yells in your direction. "You there! Your state appears to be idle. Come help us repair the corruption in this spreadsheet - if we take another millisecond, we'll have to display an hourglass cursor!"

The spreadsheet consists of rows of apparently-random numbers. To make sure the recovery process is on the right track, they need you to calculate the spreadsheet's checksum. For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.

For example, given the following spreadsheet:

5 1 9 5
7 5 3
2 4 6 8
The first row's largest and smallest values are 9 and 1, and their difference is 8.
The second row's largest and smallest values are 7 and 3, and their difference is 4.
The third row's difference is 6.
In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.

What is the checksum for the spreadsheet in your puzzle input?


--- Part Two ---

"Great work; looks like we're on the right track after all. Here's a star for your effort." However, the program seems a little worried. Can programs be worried?

"Based on what we're seeing, it looks like all the User wanted is some information about the evenly divisible values in the spreadsheet. Unfortunately, none of us are equipped for that kind of calculation - most of us specialize in bitwise operations."

It sounds like the goal is to find the only two numbers in each row where one evenly divides the other - that is, where the result of the division operation is a whole number. They would like you to find those numbers on each line, divide them, and add up each line's result.

For example, given the following spreadsheet:

5 9 2 8
9 4 7 3
3 8 6 5
In the first row, the only two numbers that evenly divide are 8 and 2; the result of this division is 4.
In the second row, the two numbers are 9 and 3; the result is 3.
In the third row, the result is 2.
In this example, the sum of the results would be 4 + 3 + 2 = 9.

What is the sum of each row's result in your puzzle input?
=end

ss = "157	564	120	495	194	520	510	618	244	443	471	473	612	149	506	138
1469	670	47	604	1500	238	1304	1426	54	749	1218	1409	60	51	1436	598
578	184	2760	3057	994	167	2149	191	2913	2404	213	1025	1815	588	2421	3138
935	850	726	155	178	170	275	791	1028	75	781	138	176	621	773	688
212	977	297	645	229	194	207	640	804	509	833	726	197	825	242	743
131	43	324	319	64	376	231	146	382	162	464	314	178	353	123	446
551	121	127	155	1197	288	1412	1285	557	137	145	1651	1549	1217	681	1649
1723	1789	5525	4890	3368	188	3369	4842	3259	2502	4825	163	146	2941	126	5594
311	2420	185	211	2659	2568	2461	231	2599	1369	821	506	2227	180	220	1372
197	4490	141	249	3615	3314	789	4407	169	352	4383	5070	5173	3115	132	3513
4228	2875	3717	504	114	2679	165	3568	3002	116	756	151	4027	261	4813	2760
651	3194	2975	2591	1019	835	3007	248	3028	1382	282	3242	296	270	3224	3304
1858	1650	1720	1848	95	313	500	1776	207	1186	72	259	281	1620	79	77
3841	3217	440	3481	3643	940	3794	4536	1994	4040	3527	202	193	1961	230	217
2837	2747	2856	426	72	78	2361	96	2784	2780	98	2041	2444	1267	2167	2480
411	178	4263	4690	3653	162	3201	4702	3129	2685	3716	147	3790	4888	79	165".split("\n")

sum = 0

ss.each do |row|
  nrow = row.split().map(&:to_i)
  sum += (nrow.max - nrow.min)
end

puts sum

#43074

# part 2
sum = 0

ss.each do |row|
  nums = row.split()
  #puts nums.inspect
  q = 0
  nums.each_with_index do |num, io|
    nums.each_with_index do |o, it|
      unless io == it
        if o.to_i % num.to_i == 0
          q = o.to_i / num.to_i
        elsif num.to_i % o.to_i == 0
          q = num.to_i / o.to_i
        end
      end
    end
  end
  sum += q
end

puts sum
#280
