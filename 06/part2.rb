class Part2
  def run
    fishes = Array.new(9, 0)
    input.map(&:to_i).tally.each { |d, c| fishes[d] = c }

    256.times do
      count = fishes.shift
      fishes[6] += count
      fishes << count
    end
    fishes.sum
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).first.split(',')
  end
end

pp Part2.new.run
