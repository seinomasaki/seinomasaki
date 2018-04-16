class Hand
  attr_reader :hand

  TWO_HAND_RANK = Hash["straight flush"=>4,"one pair"=>3,"straight"=>2,"flush"=>1,"high card"=>0]
  THREE_HAND_RANK = Hash["straight flush"=>5,"three of a kind"=>4,"straight"=>3,"flush"=>2,"one pair"=>1,"high card"=>0]
  FIVE_HAND_RANK = Hash["royal flush"=>9,"straight flush"=>8,"four of a kind"=>7,"full house"=>6,"flush"=>5,"straight"=>4,"three of a kind"=>3,"two pair"=>2,"one pair"=>1,"high card"=>0]

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

  def judg_five_card
    hand_score_five_card(judg_score_card)
  end

  def hand_score_five_card(hand)
    FIVE_HAND_RANK[hand]
  end

  def judg_score_card
    if @has_suit && @number_of_the_same_rank.size == 0 && @has_continuation
      if @has_continuation.inject{|sum, i| sum + i} == 60
        p "royal flush"
      else
        p "straight flush"
      end
    elsif !@has_suit && @number_of_the_same_rank.size == 1 && !@has_continuation
      if @number_of_the_same_rank[0] == 4
        p "four of a kind"
      elsif @number_of_the_same_rank[0] == 3
        p "three of a kind"
      elsif @number_of_the_same_rank[0] == 2
        p "one pair"
      end
    elsif !@has_suit && @number_of_the_same_rank.size == 2 && !@has_continuation
      if @number_of_the_same_rank.inject{|sum, i| sum + i} == 4
        p "two pair"
      elsif @number_of_the_same_rank.inject{|sum, i| sum + i} == 5
        p "full house"
      end
    elsif !@has_suit && @number_of_the_same_rank.size == 0 && @has_continuation
      p "straight"
    elsif @has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      p "flush"
    elsif !@has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      p "high card"
    end
  end

end

