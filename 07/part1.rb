class Part1
  def run
    crabs = input.map(&:to_i)
    median = crabs.sort[crabs.count/2]
    crabs.map{|c| (c - median).abs}.sum
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).first.split(',')
  end
end

pp Part1.new.run
