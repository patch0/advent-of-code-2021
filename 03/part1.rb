class Part1
  def run
    gamma = readings.map(&:chars).transpose.map(&:tally).map do |t|
      t['1'] > t['0'] ? '1' : '0'
    end
    mask = ('1' * gamma.length).to_i(2)
    gamma = gamma.join.to_i(2)

    epsilon = gamma ^ mask
    epsilon * gamma
  end

  def readings
    @readings ||= $stdin.readlines.map(&:chomp)
  end
end

pp Part1.new.run
