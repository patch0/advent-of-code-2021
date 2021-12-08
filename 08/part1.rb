class Part1
  def run
    counts = input.map{|l| l.split(' | ')}.map(&:last).map(&:split).flatten.map { |i| i.size }.tally
    counts[2] + counts[4] + counts[3] + counts[7]
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp)
  end
end

pp Part1.new.run
