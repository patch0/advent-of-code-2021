class Part1
  def run
    x = y = 0

    x += instructions.select{|d, c| d == 'forward'}.sum{|d, c| c.to_i}
    y += instructions.select{|d, c| d == 'down'}.sum{|d, c| c.to_i}
    y -= instructions.select{|d, c| d == 'up'}.sum{|d, c| c.to_i}
    x * y
  end

  def instructions
    @instructions ||= STDIN.readlines.map(&:split)
  end

end

pp Part1.new.run
