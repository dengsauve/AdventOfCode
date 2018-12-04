log = File.readlines("input.txt")

log.sort_by!{ |entry| entry[0..18]}

#puts log[0..10]

guards = {}

guard = ''
time = ''

# ix is 20 for log entry start
log.each do |entry|
    if entry[19] == "G"
        guard = entry.scan(/#\d+/)
        guards[guard] = 0 unless guards.include?(guard)
    elsif entry[19] == "f"
        time = entry[15..16]
    else
        guards[guard] += entry[15..16].to_i - time.to_i
    end
end

puts guards.max_by{|k,v|v}

# guard #661

sleeps = {}
track = true
time = ''

log.each do | entry |
    if entry[19..29] == "Guard #661 "
        track = true
    elsif entry[19] == "f" and track
        time = entry[15..16]
    elsif entry[19] == "w" and track
        e = entry[15..16]
        (e.to_i - time.to_i).times do | t |
            if sleeps.include?(t + time.to_i)
                sleeps[t + time.to_i] += 1
            else
                sleeps[t + time.to_i] = 1
            end
        end
    else
        track = false
    end
end

puts sleeps
puts sleeps.max_by{|k,v| v}