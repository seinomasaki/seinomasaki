class Showdown
  attr_reader :player1, :player2

  def initialize(player1, player2)
    @player1hand = player1[0]
    @player1rank = player1[1]
    @player1_same_rank = player1[2]

    @player2hand = player2[0]
    @player2rank = player2[1]
    @player2_same_rank = player2[2]
  end

  def showdown
    if @player1_same_rank.size != 0 && @player1_same_rank.size == @player2_same_rank.size
      result = same_score_hand_with_same_rank
    else
      result = win(@player1hand, @player2hand)
    end
    if result == "drow"
      result = drow_case
    end
    result
  end

  def same_score_hand_with_same_rank
    @player1_same_rank.size.times do |i|
      result = win(@player1_same_rank[i], @player2_same_rank[i])
      return result if result != "drow"
    end
  end

  def drow_case
    @player1rank.size.times do |i|
      result = win(@player1rank[i], @player2rank[i])
      return result if result != "drow"
      return result if i == (@player1rank.size - 1)
    end
  end

  def win(player1, player2)
    if player1 > player2
      "player1"
    elsif player1 < player2
      "player2"
    elsif player1 == player2
      "drow"
    end
  end

end