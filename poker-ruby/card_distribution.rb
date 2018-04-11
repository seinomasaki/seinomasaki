class Disribution
  attr_reader :bid

  CARD = Hash["1"=>"A","13"=>"K","12"=>"Q","11"=>"J"]

  def initialize(bid)
    @bid = bid
    @deck52 = Array.new
    decks
    shuffle
  end

  def decks
    ["♠","♣","◆","♥"].each do |suit|
      (1..13).each do |rank|
        @deck52 << [suit,picture(rank.to_s)]
      end
    end
  end

  def picture(rank)
    case rank
      when "1","13","12","11" then
        CARD[rank]
      else
        rank
    end
  end

  def shuffle
    @deck52 = @deck52.shuffle
  end

  def distribution
    hand = @deck52[0..@bid-1]
    @deck52.size
    @deck52.slice!(0,@bid)
    @deck52.size
    p hand
    return hand
  end

end

deck = Disribution.new(6)
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution
deck.distribution