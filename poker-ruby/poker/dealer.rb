require './deck'
require './player'
require './showdown'

class Dealer
  attr_reader :number_of_cards

  TWO_HAND_RANK = {"straight flush"=>4, "one pair"=>3, "straight"=>2, "flush"=>1, "high card"=>0}
  THREE_HAND_RANK = {"straight flush"=>5, "three of a kind"=>4, "straight"=>3, "flush"=>2, "one pair"=>1, "high card"=>0}
  FIVE_HAND_RANK = {"royal flush"=>9, "straight flush"=>8, "four of a kind"=>7, "full house"=>6, "flush"=>5, "straight"=>4, "three of a kind"=>3, "two pair"=>2, "one pair"=>1, "high card"=>0}

  def initialize(number_of_cards)
    @number_of_cards = number_of_cards
    @deck52 = Deck.new.deck
  end

  def deal
    @players_hand = Array.new
    begin
      1.upto(2) do |number|
        raise if @deck52.size < @number_of_cards
        cards = @deck52.slice!(0, @number_of_cards)
        p "prayer#{number}", cards

        player_hand,cards,same_rank_number = Player.new(cards).player_hand

        player = "@player#{number}"
        p score = [score_check(player_hand), cards, same_rank_number]
        eval("#{player} = #{score}")
      end
    rescue
      puts "deckが残り#{@deck52.size}枚で枚数が足りません"
      puts "deckを作り直します"
      @deck52 = Deck.new.deck
      # exit!
      retry
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
    winer = Showdown.new(@player1,@player2).showdown
    "victory of the #{winer} "
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

