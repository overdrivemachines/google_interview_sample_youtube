#!/usr/bin/env ruby
class Main
  attr_accessor :blocks, :reqs, :maximum_distances

  def initialize
   @blocks = [
     {"gym": false, "school": true, "store": false },
     {"gym": true, "school": false, "store": false },
     {"gym": true, "school": true, "store": false },
     {"gym": false, "school": true, "store": false },
     {"gym": false, "school": true, "store": true }
   ]

   @reqs = [:gym, :school, :store]
   @maximum_distances = Array.new
  end

  # What is the minimum distance between building and block
  def minimum_distance(building, current_block)
    # puts "current_block: " + current_block.to_s
    # puts "Looking for distance to " + building.to_s + "..."
    # initial distance must be greater than size or blocks
    # as we are trying to find the smallest distance
    distance = @blocks.size
    # puts "original distance (max dist): " + distance.to_s
    for i in 0..(@blocks.size - 1)
      if @blocks[i][building] == true
        # puts "found in block" + i.to_s
        if (i - current_block).abs < distance
          distance = (i - current_block).abs()
        end
      end
    end
    # puts "distance after loop: " + distance.to_s
    if distance == @blocks.size
      return nil
    else
      return distance
    end
  end

  def record_distances
    i = 0

    for i in 0..(@blocks.size - 1)
      # iterating through each block
      # puts "Block: " + i.to_s + ":"
      # puts "======================"
      distances = Array.new
      @reqs.each do |req|
        # iterating through required buildings
        dist = minimum_distance(req, i)
        if dist.nil?
          # puts "Distance to " + req.to_s + ": NOT FOUND"
        else
          # puts "Distance to " + req.to_s + ": " + dist.to_s
          distances.append(dist)
        end
      end
      # puts
      @maximum_distances.append(distances)

    end

    puts @maximum_distances.inspect

    best = 0
    for i in 1..(@maximum_distances.size - 1)
      if (@maximum_distances[best].max > @maximum_distances[i].max)
        best = i
      end
    end
    puts "Best Block: " + best.to_s
  end


end


m = Main.new
m.record_distances

# -----------------------------
# |-S-|G--|GS-|-S-|-ST|
# -----------------------------




