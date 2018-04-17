require './card'
require './hand'

class Player
  attr_reader :cards

  def initialize(cards)
    @player_card = cards
  end

  def player_hand
    cards_suit = Array.new
    cards_rank = Array.new
    @player_card.each { |suit, rank|
      cards_suit.push(suit)
      cards_rank.push(rank)
    }
    cards = Card.new(cards_suit,cards_rank)
    same_suit = cards.has_same_suit?
    same_rank_count,same_rank_number = cards.has_same_rank
    serial = cards.has_serial_number?

    hand = Hand.new(same_suit, same_rank_count, serial)
    p prayer_hand = hand.judg_score_card
    return prayer_hand,cards.unit,same_rank_number
  end

end