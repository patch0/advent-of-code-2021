class Part1
  def run
    next_step(%w[start]).flatten.count{|s| s == 'start'}
  end

  def next_step(route)
    possibles = input.select { |link| link.include?(route.last) }
    visited_small_caves = route.select { |c| c =~ /[a-z]/ }
    possibles = possibles.flatten - [route.last] - visited_small_caves

    return nil if possibles.empty?

    possibles.map do |cave|
      next route + [cave] if cave == 'end'

      next_step(route + [cave])
    end
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp).map { |l| l.split('-') }
  end
end

pp Part1.new.run
