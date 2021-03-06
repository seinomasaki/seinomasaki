require './cardopen'
require './prayer'

class Poker
  attr_reader :number_of_sheets

  def initialize(bid)
    @number_of_sheets = bid
    @deck = Disribution.new(@number_of_sheets)
  end

  def game
    prayer1,hand = has_cards_hand
    p "prayer1:#{hand}"
    prayer2,hand = has_cards_hand
    p "prayer2:#{hand}"
    hands = prayer1 + prayer2
    p Cardopen.new(hands).open
  end

  def has_cards_hand
    prayer_card = @deck.deal
    cards = Card.new(prayer_card)
    cards_score = [cards.has_same_suits?,
                   cards.numbers_of_the_same_rank,
                   cards.has_same_connections?]
    hand_rank = Hand.new(cards_score)
    if @number_of_sheets == 2
      hand = hand_rank.judg_two_card
    elsif @number_of_sheets == 3
      hand = hand_rank.judg_three_card
    elsif @number_of_sheets == 5
      hand = hand_rank.judg_five_card
    end
    return [hand, cards.unit],prayer_card
  end

end

if __FILE__ == $0
  p "手札を何枚にしますか？(1枚以上)"
  poker = Poker.new(gets.to_i)
  1.upto(30) do |i|
    puts "        "
    puts "game#{i}"
    poker.game
  end

end