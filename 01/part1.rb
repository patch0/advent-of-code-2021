class Part1

  def run
    pp depths[0..-2].zip(depths[1..-1]).map{|a,b| b - a}.select{|c| c > 0}.size
  end

  def depths
    @depths ||= STDIN.readlines.map{|l| Integer(l.chomp) rescue nil}.compact
  end
end


Part1.new.run
