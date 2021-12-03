class Part2
  def initialize
    @x = @y = @aim = 0
  end

  def run
    instructions.each { |i| send(*i) }
    @x * @y
  end

  def instructions = $stdin.readlines.map(&:split).map { |a, b| [a, b.to_i] }

  def down(amt) = @aim += amt

  def up(amt) = @aim -= amt

  def forward(amt)
    @x += amt
    @y += @aim * amt
  end
end

pp Part2.new.run
