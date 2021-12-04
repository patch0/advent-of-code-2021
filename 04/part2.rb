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
    (@data - @matches).sum
  end
end

class Part2
  def run
    sequence.each do |n|
      if cards.size > 1
        cards.delete_if { |c| c.wins_with?(n) }
        next
      end

      card = cards.first
      return card.score * n if card.wins_with?(n)
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

pp Part2.new.run
