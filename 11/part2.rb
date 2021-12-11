class Part2
  RANGE = (0...10)

  def run
    step = 0
    loop do
      step += 1
      increment_brightness
      f = flash_all

      break step if f == 100
    end
  end

  def increment_brightness
    input.each { |y| y.map!(&:succ) }
  end

  def flash_all
    RANGE.sum do |y|
      RANGE.sum do |x|
        flash(x: x, y: y)
      end
    end
  end

  def flash(x:, y:)
    return 0 if input[y][x] <= 9

    input[y][x] = 0

    1 + (x - 1..x + 1).sum do |x2|
      next 0 unless RANGE.include? x2

      (y - 1..y + 1).sum do |y2|
        next 0 unless RANGE.include?(y2) && input[y2][x2].positive?

        input[y2][x2] += 1
        flash(x: x2, y: y2)
      end
    end
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).map(&:chars).map { |l| l.map(&:to_i) }
  end
end

pp Part2.new.run
