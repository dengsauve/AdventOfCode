input = File.read("input.txt")

array = input.split("")

puts "initial count: #{array.length}"

cleared = false

until cleared
    cleared = true
    array.each_with_index do | letter, index |
        unless index == array.length - 1
            if letter == array[index + 1].swapcase
                array.delete_at(index)
                array.delete_at(index)
                cleared = false
            end
        end
    end
end

puts array.inspect
puts "final count: #{array.length}"
#27651 not correct