class Showdown
  attr_reader :hands

  def initialize(hands)
    prayer1_cards = hands[0]
    @prayer1hand = prayer1_cards[0]
    @prayer1ranks = prayer1_cards[1]
    prayer2_cards = hands[1]
    @prayer2hand = prayer2_cards[0]
    @prayer2ranks = prayer2_cards[1]
  end

  def showdown
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
      "winer prayer1"
    elsif prayer1 < prayer2
      "winer prayer2"
    elsif prayer1 == prayer2
      "drow"
    end
  end

end