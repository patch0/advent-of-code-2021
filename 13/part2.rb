class Part2
  def run
    input.each do |l|
      next unless l =~ /(x|y)=(\d+)/

      fold(**{ Regexp.last_match(1).to_sym => Regexp.last_match(2).to_i })
      dots.uniq!
    end
    visualize
  end

  def visualize
    str = []
    dots.each do |x, y|
      str[y] ||= Array.new(0, ' ')
      str[y][x] = '#'
    end

    str.map do |l|
      l.map do |c|
        c || ' '
      end.join
    end.join("\n")
  end

  def fold(x: nil, y: nil)
    return fold_y(y) if y

    fold_x(x) if x
  end

  def fold_y(y)
    dots.select { |d| d[1] >= y }.each do |d|
      d[1] -= (d[1] - y) * 2
    end
  end

  def fold_x(x)
    dots.select { |d| d[0] >= x }.each do |d|
      d[0] -= (d[0] - x) * 2
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

puts Part2.new.run
