class Fish
  attr_reader :state

  def initialize(state) = @state = state.to_i

  def step
    @state -= 1

    if @state.negative?
      @state = 6
      return [self, Fish.new(8)]
    end

    self
  end
end

class Part1
  def run
    fishes = input.map { |i| Fish.new(i) }
    81.times do
      fishes = fishes.flatten.map { |f| f.step }
    end
    fishes.count
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).first.split(',')
  end
end

pp Part1.new.run
