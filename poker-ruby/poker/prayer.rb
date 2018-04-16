require './card'
require './hand'

class Prayer
  attr_reader :hand

  def initialize(hand,prayer_number)
    @prayer_card = hand
    @prayer_number = prayer_number
  end

  def cards
    p "prayer#{@prayer_number}: ",@prayer_card
    card = Card.new(@prayer_card)
    card_score = [card.has_same_suits?,
                   card.numbers_of_the_same_rank,
                   card.has_serial_number?]
    hand_rank = Hand.new(card_score)
    [hand_rank.judg_score_card,card.unit]
  end

end