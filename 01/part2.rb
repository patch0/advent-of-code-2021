class Part2
  def run
    windows[0..-2].zip(windows[1..-1]).map{|a, b| a - b}.select{|c| c < 0}.size
  end

  def windows
    @windows ||= depths[0..-3].zip(depths[1..-2], depths[2..-1]).map(&:sum)
  end

  def depths
    @depths ||= STDIN.readlines.map{|l| Integer(l.chomp) rescue nil}.compact
  end
end


pp Part2.new.run
