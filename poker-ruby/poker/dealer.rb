require './deck'
require './prayer'
require './showdown'

class Dealer
  attr_reader :number_of_card

  TWO_HAND_RANK = Hash["straight flush"=>4,"one pair"=>3,"straight"=>2,"flush"=>1,"high card"=>0]
  THREE_HAND_RANK = Hash["straight flush"=>5,"three of a kind"=>4,"straight"=>3,"flush"=>2,"one pair"=>1,"high card"=>0]
  FIVE_HAND_RANK = Hash["royal flush"=>9,"straight flush"=>8,"four of a kind"=>7,"full house"=>6,"flush"=>5,"straight"=>4,"three of a kind"=>3,"two pair"=>2,"one pair"=>1,"high card"=>0]

  def initialize(number_of_cards)
    @number_of_cards = number_of_cards
    @deck52 = Deck.new.instance_variable_get('@deck52')
  end

  def distribute
    @prayers_hand = Array.new
    1.upto(2) do |number|
      begin
        raise if @deck52.size < @number_of_cards
        hand = @deck52.slice!(0, @number_of_cards)
        prayer_hand = Prayer.new(hand,number).cards
        hand = prayer_hand[0]
        cards = prayer_hand[1]
        same_rank_number_list = prayer_hand[2]
        @prayers_hand << [score_check(hand),cards,same_rank_number_list]
      rescue
        puts "deckが残り#{@deck52.size}枚で枚数が足りません"
        puts "gameを終了します"
        exit!
      end
    end
    p showdown
  end

  def score_check(hand)
    if @number_of_cards == 2
      hand_score_two_card(hand)
    elsif @number_of_cards == 3
      hand_score_three_card(hand)
    elsif @number_of_cards == 5
      hand_score_five_card(hand)
    end
  end

  def showdown
    Showdown.new(@prayers_hand).showdown
  end

  def hand_score_two_card(hand)
    TWO_HAND_RANK[hand]
  end

  def hand_score_three_card(hand)
    THREE_HAND_RANK[hand]
  end

  def hand_score_five_card(hand)
    FIVE_HAND_RANK[hand]
  end

end

