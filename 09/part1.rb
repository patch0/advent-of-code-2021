class Part1
  def run
    y_max = input.size - 1
    x_max = input.first.size - 1
    minima = 0
    (0..y_max).each do |y|
      (0..x_max).each do |x|
        u = y > 0     ? input[y - 1][x] : nil
        d = y < y_max ? input[y + 1][x] : nil
        l = x > 0     ? input[y][x - 1] : nil
        r = x < x_max ? input[y][x + 1] : nil

        value = input[y][x]

        next unless [u, d, l, r].all?{|v| v.nil? || value < v}

        minima += value + 1
      end
    end
    minima
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).map(&:chars).map { |l| l.map(&:to_i) }
  end
end

pp Part1.new.run
