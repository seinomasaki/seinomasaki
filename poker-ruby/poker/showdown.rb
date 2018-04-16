class Showdown
  attr_reader :hands

  def initialize(hands)
    prayer1_cards = hands[0]
    @prayer1hand = prayer1_cards[0]
    @prayer1ranks = prayer1_cards[1]
    @prayer1_same_rank_number = prayer1_cards[2]
    prayer2_cards = hands[1]
    @prayer2hand = prayer2_cards[0]
    @prayer2ranks = prayer2_cards[1]
    @prayer2_same_rank_number = prayer2_cards[2]
  end

  def showdown
    if @prayer1_same_rank_number.size != 0 && @prayer1_same_rank_number.size == @prayer2_same_rank_number.size
      result = same_score_hand_with_same_rank
    else
      result = win(@prayer1hand,@prayer2hand)
    end
    if result == "drow"
      result = drow_case
    end
    result
  end

  def same_score_hand_with_same_rank
    @prayer1_same_rank_number.size.times do |i|
      result = win(@prayer1_same_rank_number[i],@prayer2_same_rank_number[i])
      return result if result != "drow"
    end
  end

  def drow_case
    @prayer1ranks.size.times do |i|
      result = win(@prayer1ranks[i],@prayer2ranks[i])
      return result if result != "drow"
      return result if i == (@prayer1ranks.size - 1)
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