$array = File.readlines("input.txt")

$array.each_with_index do |box, ixx|
    
    boxarr = box.strip().split("")

    boxarr.each_with_index do | letter, ix |
        compare = boxarr.clone
        compare.delete_at(ix)
        $array.each_with_index do | boxc, ixxx |
            unless ixx == ixxx
                c_to = boxc.strip().split("")

                compare.each do | l |
                    if c_to.include?(l)
                        c_to.delete_at(c_to.index(l))
                    end
                end

                if c_to.length == 1
                    unless c_to[ix] == letter
                        puts boxc, box
                    end
                end
            end
        end
    end

    puts "Completed iteration: " + ixx.to_s
end

# it gave me the answer, but doesn't 100% work
