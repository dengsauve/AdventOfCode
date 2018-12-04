# get all guards
guards = []
sleepies = {}
log = File.readlines("input.txt")
log.sort_by!{ |entry| entry[0..18]}

# Get all guards in list
log.each do |entry|
    if entry[19] == "G" || entry[19] == "g"
        guard = entry.scan(/#\d+/)
        guards << guard unless guards.include?(guard)
    end
end

# For each of the guards, grab all the minutes asleep
guards.each do |guard|
    # sleeps holds the minutes and their values
    sleeps = {}
    track = false
    time = ''
    log.each do | entry |
        entry.scan(/#\d+/)
        if entry.scan(/#\d+/) == guard
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
            time = ''
            e = ''
        else
            track = false
        end
    end
    m = sleeps.max_by{|k,v| v}
    puts m.inspect
    puts guard
    # Add the guard and the most minutes asleep on a mintue
    sleepies[guard] = m[1] unless m.nil?
end

# puts guard that was most asleep on a minute, backtrack to earlier output to figure what minute
puts "MAX", sleepies.max_by{|k, v| v}.inspect#,sleepies

#12645 not right
#17212 "   "
#18449 "   "
#17543 "   "