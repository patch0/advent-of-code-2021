class Part1
  attr_accessor :molecule

  def run
    molecule = input.first.chars
    10.times do
      molecule = polymerise(molecule)
    end

    tally = molecule.tally.sort { |a, b| a[1] <=> b[1] }
    tally.last[1] - tally.first[1]
  end

  def polymerise(molecule)
    new_molecule = []
    molecule.each_cons(2) do |a, b|
      element = rules["#{a}#{b}"]
      new_molecule += [a, element].compact
    end
    new_molecule << molecule.last
    new_molecule
  end

  def input
    @input ||= $stdin.readlines.map(&:chomp)
  end

  def rules
    @rules ||= input[2..].map { |l| l.split(' -> ') }.to_h
  end
end

pp Part1.new.run
