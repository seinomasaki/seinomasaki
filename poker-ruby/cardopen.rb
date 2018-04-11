class Cardopen
  attr_reader :hands

  def initialize(hands)
    @prayer1hand = hands[0]
    @prayer1ranks = hands[1]
    @prayer2hand = hands[2]
    @prayer2ranks = hands[3]
  end

  def open
    result = win(@prayer1hand,@prayer2hand)
    if result == "drow"
      result = drow_case
    end
    result
  end

  def drow_case
    @prayer1ranks.size.times do |i|
      result = win(@prayer1ranks[i],@prayer2ranks[i])
      break result if result != "drow"
      break result if i == (@prayer1ranks.size - 1)
    end
  end

  def win(prayer1,prayer2)
    if prayer1 > prayer2
      "prayer1"
    elsif prayer1 < prayer2
      "prayer2"
    elsif prayer1 == prayer2
      "drow"
    end
  end

end


