patterns = File.readlines("input.txt")

fabric = []
overlaps = 0

1000.times do
    fabric << []
end

fabric.each do |spot|
    1000.times do
        spot << 0
    end
end

patterns.each do | pattern |
    start = pattern.split(" ")[2].tr(":", "").split(",")
    x = start[0].to_i
    y = start[1].to_i

    sides = pattern.split(" ")[3].split("x")
    lenx = sides[0].to_i
    leny = sides[1].to_i

    #puts lenx, leny

    leny.times do |yy|
        lenx.times do |xx|
            fabric[y + yy][x + xx] += 1
        end
    end
end

patterns.each do | pattern |
    ones = true
    start = pattern.split(" ")[2].tr(":", "").split(",")
    x = start[0].to_i
    y = start[1].to_i

    sides = pattern.split(" ")[3].split("x")
    lenx = sides[0].to_i
    leny = sides[1].to_i

    #puts lenx, leny

    leny.times do |yy|
        lenx.times do |xx|
            if fabric[y + yy][x + xx] != 1
                ones = false
            end
        end
    end

    puts pattern.split(" ")[0] if ones
end

fabric.each do |line|
    line.each do |inch|
        if inch > 1
            overlaps += 1
        end
    end
end

puts overlaps
#1275 not right