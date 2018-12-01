require 'time'

t = Time.now

$freq = 0
$freqs = {0 => true}
$found = false
iters = 1

def loop
    File.open("freq.txt", "r").each do |change|
        if change.split("")[0] == "+"
            $freq += change.split("")[1..-1].join().to_i
            if $freqs.include?($freq)
                puts $freq
                $found = true
                break
            else
                $freqs[$freq] = true
            end
        else
            $freq -= change.split("")[1..-1].join().to_i
            if $freqs.include?($freq)
                puts $freq
                $found = true
                break
            else
                $freqs[$freq] = true
            end
        end
    end
end

until $found
    loop()
    puts "iterations: #{iters}"
    iters += 1
end

e=Time.now

puts "time elapsed: #{e - t}"
#puts $freqs
#433 not right