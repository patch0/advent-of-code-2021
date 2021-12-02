class Part2
  def run
    x = y = aim = 0

    instructions.each do |d, c|
      c = c.to_i
      case d
      when 'forward'
        x += c
        y += aim * c
      when 'up'
        aim -= c
      when 'down'
        aim += c
      end
    end
    x * y
  end

  def instructions
    @instructions ||= STDIN.readlines.map(&:split)
  end

end

pp Part2.new.run
