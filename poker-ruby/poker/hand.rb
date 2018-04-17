class Hand
  attr_reader :suit, :same_rank_count, :serial

  def initialize(suit,same_rank_count,serial)
    @suit = suit
    @same_rank_count = same_rank_count
    @serial_number = serial
  end

  def judg_score_card
    if @serial_number
      serial_card
    elsif !@suit && @same_rank_count.size == 1
      one_set_of_same_rank
    elsif !@suit && @same_rank_count.size == 2
      two_sets_of_same_rank
    elsif @suit && @same_rank_count.size == 0 && !@serial_number
      "flush"
    elsif !@suit && @same_rank_count.size == 0 && !@serial_number
      "high card"
    end
  end

  def one_set_of_same_rank
    if @same_rank_count[0] == 4
      "four of a kind"
    elsif @same_rank_count[0] == 3
      "three of a kind"
    elsif @same_rank_count[0] == 2
      "one pair"
    end
  end

  def two_sets_of_same_rank
    if @same_rank_count.inject{ |sum, i| sum + i} == 4
      "two pair"
    elsif @same_rank_count.inject{ |sum, i| sum + i} == 5
      "full house"
    end
  end

  def serial_card
    if @suit
      if @serial_number.inject{ |sum, i| sum + i} == 60
        "royal flush"
      else
        "straight flush"
      end
    elsif !@suit
      "straight"
    end
  end

end
