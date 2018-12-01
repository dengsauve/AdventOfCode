require 'time'

t = Time.now

$freq = 0
$freqs = {0 => true}
$found = false
$input = File.readlines("freq.txt")
iters = 0

def loop
    $input.each do |change|
        arr = change.split("") 
        if arr[0] == "+"
            $freq += arr[1..-1].join().to_i
        else
            $freq -= arr[1..-1].join().to_i
        end
        if $freqs.include?($freq)
            puts $freq
            $found = true
            break
        else
            $freqs[$freq] = true
        end
    end
end

until $found
    loop()
    iters += 1
end

e=Time.now

puts "time elapsed: #{e - t}"
puts "iterations: #{iters}"
#puts $freqs
#433 not right