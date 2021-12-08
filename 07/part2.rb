class Part2
  def run
    crabs = input.map(&:to_i)
    mean = (crabs.sum / crabs.count)
    cost = nil
    ((mean - 5)..(mean + 5)).each do |pos|
      new_cost = crabs.map { |c| (0..(c - pos).abs).sum }.sum
      return cost if cost && new_cost > cost

      cost = new_cost
    end
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).first.split(',')
  end
end

pp Part2.new.run
