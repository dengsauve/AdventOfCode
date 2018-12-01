require 'time'

t = Time.now
freq = 0

File.open("freq.txt", "r").each do |change|
    if change.split("")[0] == "+"
        freq += change.split("")[1..-1].join().to_i
    else
        freq -= change.split("")[1..-1].join().to_i
    end
end

puts freq
e = Time.now
puts "time elapsed: #{e - t}"