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

  def deal
    begin
      raise if @deck52.size < @bid
      hand = @deck52.slice!(0,@bid)
      return hand
    rescue
      puts "deckの数が足りません"
      exit!
    end

  end

end