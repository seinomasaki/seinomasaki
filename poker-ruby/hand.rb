class Hand
  attr_reader :hand

  TWO_HAND_RANK = Hash["straight flush"=>4,"pair"=>3,"straight"=>2,"flush"=>1,"high card"=>0]
  THREE_HAND_RANK = Hash["straight flush"=>5,"three of a kind"=>4,"straight"=>3,"flush"=>2,"pair"=>1,"high card"=>0]

  def initialize(hand)
    @has_suit = hand[0]
    @number_of_the_same_rank = hand[1]
    @has_continuation = hand[2]
  end

  def judg_two_card
    hand_score_two_card(judg_score_card)
  end

  def hand_score_two_card(hand)
    TWO_HAND_RANK[hand]
  end

  def judg_three_card
    hand_score_three_card(judg_score_card)
  end

  def hand_score_three_card(hand)
    THREE_HAND_RANK[hand]
  end

  def judg_score_card
    if @has_suit && @number_of_the_same_rank.size == 0 && @has_continuation
      p "straight flush"
    elsif !@has_suit && @number_of_the_same_rank.size == 1 && @number_of_the_same_rank[0] == 3 && !@has_continuation
      p "three of a kind"
    elsif !@has_suit && @number_of_the_same_rank.size == 0 && @has_continuation
      p "straight"
    elsif @has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      p "flush"
    elsif !@has_suit && @number_of_the_same_rank.size == 1 && @number_of_the_same_rank[0] == 2 && !@has_continuation
      p "pair"
    elsif !@has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      p "high card"
    end
  end

end