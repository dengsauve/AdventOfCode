
$array = File.readlines("input.txt")

#$array = ["abcd"]


twos = 0
threes = 0

$array.each do |id|
    str = id.split("")
    letters = {}

    str.each do |letter|
        if letters.include?(letter)
            letters[letter] += 1
        else
            letters[letter] = 1
        end
    end

    three = letters.key(3)
    two = letters.key(2)

    puts two.inspect, three.inspect

    unless three == nil 
        threes += 1
    end
    unless two == nil 
        twos += 1
    end
end


puts "twos: " + twos.to_s
puts "threes: " + threes.to_s

puts twos * threes
#7250 not right