require './card'
require './hand'
require './cardopen'
require './card_distribution'

class Prayer
  attr_reader :people

  def initialize(number_of_sheets)
    @number_of_sheets = number_of_sheets
    @deck52 = Array.new
    decks
    shuffle
  end

  def prayer_hand
    prayer,hand = has_cards_hand
    p "prayer1:#{hand}"
    return prayer
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