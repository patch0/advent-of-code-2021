class Line
  attr_reader :coords

  def initialize(coords)
    @coords = coords
  end

  def points
    @points ||= if horizontal?
                  r = (coords[0]..coords[2]).step(coords[2] <=> coords[0]).to_a
                  r.zip(Array.new(r.length, coords[1]))
                elsif vertical?
                  r = (coords[1]..coords[3]).step(coords[3] <=> coords[1]).to_a
                  Array.new(r.length, coords[0]).zip(r)
                else
                  r = (coords[0]..coords[2]).step(coords[2] <=> coords[0]).to_a
                  s = (coords[1]..coords[3]).step(coords[3] <=> coords[1]).to_a
                  r.zip(s)
                end
  end

  def vertical?
    coords[0] == coords[2]
  end

  def horizontal?
    coords[1] == coords[3]
  end
end

class Part2
  def run
    lines = input.map { |coords| Line.new(coords) }

    lines.map(&:points).flatten(1).tally.count { |_h, k| k > 1 }
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).map { |l| l.split(/\D+/).map(&:to_i) }
  end
end

pp Part2.new.run
