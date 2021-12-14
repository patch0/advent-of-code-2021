class Part2
  def run
    tally = input.first.chars.each_cons(2).tally

    40.times { tally = polymerise(tally) }

    totals = tot_up(tally).sort { |a, b| a[1] <=> b[1] }

    totals.last[1] - totals.first[1]
  end

  def tot_up(tally)
    totals = Hash.new(0)
    tally.each { |k, v| totals[k[0]] += v }

    # Add one for the last entry in the input
    totals[input.first.chars.last] += 1

    totals
  end

  def polymerise(tally)
    new_tally = Hash.new(0)

    tally.each do |pair, cnt|
      x = rules[pair.join]
      new_tally[[pair.first, x]] += cnt
      new_tally[[x, pair.last]] += cnt
    end

    new_tally
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp)
  end

  def rules
    @rules ||= input[2..].map { |l| l.split(' -> ') }.to_h
  end
end

pp Part2.new.run
