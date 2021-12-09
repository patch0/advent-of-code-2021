class Part2
  def run
    sizes = []
    (0..y_max).each do |y|
      (0..x_max).each do |x|
        value = input[y][x]
        next unless minimum_at?(value: value, x: x, y: y)
        basin = [[y, x]]

        basin = find_edge(basin: basin, pos: [y, x])
        sizes << basin.count
      end
    end
    sizes.sort.last(3).inject(:*)
  end

  def find_edge(basin:, pos:)
    x = pos[1]
    (pos[0]-1..pos[0]+1).each do |y|
      next if y < 0 || y > y_max
      next if input[y][x] == 9 || basin.include?([y,x])

      basin << [y, x]
      basin = find_edge(basin: basin, pos: [y, x])
    end

    y = pos[0]
    (pos[1]-1..pos[1]+1).each do |x|
      next if x < 0 || x > x_max
      next if input[y][x] == 9 || basin.include?([y,x])

      basin << [y, x]
      basin = find_edge(basin: basin, pos: [y, x])
    end

    basin
  end

  def minimum_at?(value:, x:, y:)
    value < 9 &&
      (y.zero? || input[y - 1][x] > value) &&
      (x.zero? || input[y][x - 1] > value) &&
      (y == y_max || input[y + 1][x] > value) &&
      (x == x_max || input[y][x + 1] > value)
  end

  def y_max = @y_max ||= input.size - 1
  def x_max = @x_max ||= input.first.size - 1

  def input
    @input ||= $stdin.readlines.map(&:chomp).map(&:chars).map { |l| l.map(&:to_i) }
  end
end

pp Part2.new.run
