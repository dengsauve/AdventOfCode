log, guards, guard, time = File.readlines("input.txt").sort_by!{ |entry| entry[0..18]},  {}, '', ''
log.each do |entry|
    if entry[19] == "G"
        guard = entry.scan(/#\d+/)
        guards[guard] = 0 unless guards.include?(guard)
    elsif entry[19] == "f"
        time = entry[15..16]
    else
        guards[guard] += entry[15..16].to_i - time.to_i
    end end
puts guards.max_by{|k,v|v}
sleeps, track, time = {}, true, ''
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
            end end
    else
        track = false
    end end
puts sleeps.max_by{|k,v| v}