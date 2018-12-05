input = File.read("input.txt")

zarray = input.split("")
answers = {}

('a'..'z').each do | rm |
    cleared = false
    array = zarray.dup
    array.delete(rm)
    array.delete(rm.upcase)
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
    answers[rm] = array.length
end

puts answers
puts answers.min_by{ |k, v| v}
# 10862 not right