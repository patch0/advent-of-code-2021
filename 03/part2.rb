module Weed
  refine Array do
    def weed(pos, common: true)
      return if count == 1

      mask = 1 << (pos - 1)
      bit = count { |r| (r & mask).positive? } >= (count / 2.0) ? 1 : 0
      bit ^= 1 unless common
      delete_if { |r| (bit == 1) == (r & mask).zero? }
    end
  end
end

class Part2
  using Weed

  def run
    n_bits = input.first.length

    (n_bits..0).step(-1).each do |pos|
      o2_readings.weed(pos)
      co2_readings.weed(pos, common: false)
    end

    o2_readings.first * co2_readings.first
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp)
  end

  def o2_readings
    @o2_readings ||= input.map { |i| i.to_i(2) }
  end

  def co2_readings
    @co2_readings ||= input.map { |i| i.to_i(2) }
  end
end

pp Part2.new.run
