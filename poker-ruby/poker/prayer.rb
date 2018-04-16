require './card'
require './hand'

class Prayer
  attr_reader :hand

  def initialize(hand,prayer_number)
    @prayer_card = hand
    @prayer_number = prayer_number
  end

  def cards
    p "prayer#{@prayer_number}", @prayer_card
    card = Card.new(@prayer_card)
    card_score = [card.has_same_suits?,
                   card.numbers_of_the_same_rank,
                   card.has_serial_number?]
    hand_rank = Hand.new(card_score)
    p prayer_hand = hand_rank.judg_score_card
    same_rank_number_list = card_score[1][1]
    [prayer_hand,card.unit,same_rank_number_list]
  end

end