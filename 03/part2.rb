module MostCommonPos
  refine Array do
    def most_common_bit_at(pos)
      mask = 1 << (pos - 1)
      count { |r| (r & mask).positive? } >= (count / 2.0) ? 1 : 0
    end
  end
end

module Weed
  refine Array do
    def weed(mask, bit)
      return if count == 1

      delete_if { |r| (bit == 1) == (r & mask).zero? }
    end
  end
end

class Part2
  using MostCommonPos
  using Weed

  def run
    n_bits = input.first.length

    (n_bits..0).step(-1).each do |pos|
      mask = 1 << (pos - 1)

      common_bit = o2_readings.most_common_bit_at(pos)
      o2_readings.weed(mask, common_bit)

      uncommon_bit = co2_readings.most_common_bit_at(pos) ^ 1
      co2_readings.weed(mask, uncommon_bit)
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
