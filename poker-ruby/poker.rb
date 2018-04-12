require './card'
require './hand'
require './cardopen'
require './card_distribution'

class Poker
  def game
    prayer1 = has_cards_hand
    p "prayer1:#{prayer1}"
    prayer2 = has_cards_hand
    p "prayer2:#{prayer2}"
    hands = prayer1 + prayer2
    p Cardopen.new(hands).open
  end

  def has_cards_hand
    deck = Disribution.new(3)
    prayer_card = deck.deal
    cards = Card.new(prayer_card)
    cards_score = [cards.has_same_suits?,
                   cards.numbers_of_the_same_rank,
                   cards.has_same_connections?]
    hand_rank = Hand.new(cards_score)
    [hand_rank.judg_three_card, cards.unit]
  end

end

if __FILE__ == $0
  Poker.new.game
end