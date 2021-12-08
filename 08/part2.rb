require 'byebug'

class Display
  attr_reader :input, :output, :mappings, :numbers

  def initialize(input, output)
    @input = input.split.map(&:chars).map(&:sort)
    @output = output.split.map(&:chars).map(&:sort)
    @numbers = Array.new(10)
  end

  def resolve_numbers
    numbers[1] ||= (input + output).find { |t| t.size == 2 }
    numbers[4] ||= (input + output).find { |t| t.size == 4 }
    numbers[7] ||= (input + output).find { |t| t.size == 3 }
    numbers[8] ||= %w[a b c d e f g]

    (input + output).select { |t| t.size == 5 }.each do |digit|
      if numbers[4] && numbers[1]
        numbers[3] ||= digit if (digit - numbers[4]).size == 2 && (digit - numbers[1]).size == 3
        numbers[5] ||= digit if (digit - numbers[4]).size == 2 && (digit - numbers[1]).size == 4
      end

      numbers[2] ||= digit if numbers[5] && (numbers[5] - digit).size == 2
    end

    (input + output).select { |t| t.size == 6 }.each do |digit|
      numbers[6] ||= digit if numbers[1] && (digit - numbers[1]).size == 5
      numbers[0] ||= digit if numbers[5] && (numbers[5] - digit).size == 1

      next unless numbers[7]

      numbers[6] ||= digit if (numbers[7] - digit).size == 1

      next unless numbers[5]

      numbers[9] ||= digit if ((numbers[7] | numbers[5]) - digit).empty?
    end
  end

  def decode
    decoded_output = Array.new(output.size)
    loop do
      resolve_numbers

      new_output = output.map do |o|
        numbers.index(o)
      end

      return decoded_output if new_output == decoded_output

      decoded_output = new_output
    end
  end
end

class Part2
  def run
    inputs.map { |l| l.split(' | ') }.sum do |io|
      n = Display.new(*io).decode
      break if n.any?{|i| i.nil?}

      n.join.to_i
    end
  end

  def inputs
    @inputs ||= $stdin.readlines.map(&:chomp)
  end
end

pp Part2.new.run
