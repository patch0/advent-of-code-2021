class Part1
  def run

    fold(x: 655)
    dots.uniq.count
  end

  def fold(x: nil, y: nil)
    return fold_y(y) if y

    fold_x(x) if x
  end

  def fold_y(y)
    dots.select { |d| d[1] >= y }.each do |d|
      d[1] -= (d[1] - y)*2
    end
  end

  def fold_x(x)
    dots.select { |d| d[0] >= x }.each do |d|
      d[0] -= (d[0] - x)*2
    end
  end

  def dots
    return @dots if defined? @dots

    dots = []
    input.each do |l|
      break if l.empty?

      dots << l.split(',').map(&:to_i)
    end

    @dots = dots
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp)
  end
end

pp Part1.new.run
