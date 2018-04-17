class Hand
  attr_reader :hand

  def initialize(hand)
    @suit = hand[0]
    same_rank_lists = hand[1]
    @count_of_the_same_rank = same_rank_lists[0]
    @serial_number = hand[2]
  end

  def judg_score_card
    if @serial_number
      serial_card
    elsif !@suit && @count_of_the_same_rank.size == 1
      one_set_of_same_rank
    elsif !@suit && @count_of_the_same_rank.size == 2
      two_sets_of_same_rank
    elsif @suit && @count_of_the_same_rank.size == 0 && !@serial_number
      "flush"
    elsif !@suit && @count_of_the_same_rank.size == 0 && !@serial_number
      "high card"
    end
  end

  def one_set_of_same_rank
    if @count_of_the_same_rank[0] == 4
      "four of a kind"
    elsif @count_of_the_same_rank[0] == 3
      "three of a kind"
    elsif @count_of_the_same_rank[0] == 2
      "one pair"
    end
  end

  def two_sets_of_same_rank
    if @count_of_the_same_rank.inject{|sum, i| sum + i} == 4
      "two pair"
    elsif @count_of_the_same_rank.inject{|sum, i| sum + i} == 5
      "full house"
    end
  end

  def serial_card
    if @suit
      if @serial_number.inject{|sum, i| sum + i} == 60
        "royal flush"
      else
        "straight flush"
      end
    elsif !@suit
      "straight"
    end
  end

end
