class Card
  def initialize(data)
    @data = data
    @matches = []
    @positions = 5.times.map { Array.new(5, 0) }
  end

  def won?
    (@positions.map(&:sum) + @positions.transpose.map(&:sum)).any? { |a| a == 5 }
  end

  def wins_with?(num)
    pos = @data.index(num)
    return false unless pos

    @matches << num
    @positions[pos / 5][pos % 5] = 1
    won?
  end

  def score
    (@data - @matches).sum * @matches.last
  end
end

class Part1
  def run
    sequence.each do |n|
      winner = cards.find { |c| c.wins_with?(n) }
      next unless winner

      return winner.score
    end
  end

  def sequence
    @sequence ||= $stdin.readline.chomp.split(',').map(&:to_i)
  end

  def cards
    @cards ||= $stdin.readlines.map(&:chomp).each_slice(6).map do |l|
      card = l.join(' ').split.compact.map(&:to_i)

      Card.new(card)
    end
  end
end

pp Part1.new.run
