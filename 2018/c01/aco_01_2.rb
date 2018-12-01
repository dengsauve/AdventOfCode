freq = 0
freqs = [0]
found = false
iters = 1

until found
    File.open("freq.txt", "r").each do |change|
        if change.split("")[0] == "+"
            freq += change.split("")[1..-1].join().to_i
            if freqs.include?(freq)
                puts freq
                found = true
                break
            else
                freqs << freq
            end
        else
            freq -= change.split("")[1..-1].join().to_i
            if freqs.include?(freq)
                puts freq
                found = true
                break
            else
                freqs << freq
            end
        end
    end
    puts "iterations: #{iters}"
    iters += 1
end

#puts freqs
#433 not right