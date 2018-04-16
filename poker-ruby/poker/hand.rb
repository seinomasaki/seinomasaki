class Hand
  attr_reader :hand

  def initialize(hand)
    @has_suit = hand[0]
    @number_of_the_same_rank = hand[1]
    @has_continuation = hand[2]
  end

  def judg_score_card
    if @has_continuation
      serial_card
    elsif !@has_suit && @number_of_the_same_rank.size == 1
      one_set_of_same_rank
    elsif !@has_suit && @number_of_the_same_rank.size == 2
      two_sets_of_same_rank
    elsif @has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      "flush"
    elsif !@has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      "high card"
    end
  end

  def one_set_of_same_rank
    if @number_of_the_same_rank[0] == 4
      "four of a kind"
    elsif @number_of_the_same_rank[0] == 3
      "three of a kind"
    elsif @number_of_the_same_rank[0] == 2
      "one pair"
    end
  end

  def two_sets_of_same_rank
    if @number_of_the_same_rank.inject{|sum, i| sum + i} == 4
      "two pair"
    elsif @number_of_the_same_rank.inject{|sum, i| sum + i} == 5
      "full house"
    end
  end

  def serial_card
    if @has_suit
      if @has_continuation.inject{|sum, i| sum + i} == 60
        "royal flush"
      else
        "straight flush"
      end
    elsif !@has_suit
      "straight"
    end
  end

end
