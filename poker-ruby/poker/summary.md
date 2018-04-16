pokerの役判定[2018/04/16]

poker.rb
require './dealer'

class Poker
  attr_reader :number_of_card

  def initialize(number_of_card)
    @dealer = Dealer.new(number_of_card)
  end

  def game
    1.upto(30) do |i|
      puts "-------","game#{i}"
      @dealer.distribute
    end
  end

end

if $PROGRAM_NAME == __FILE__
  p '手札を何枚にしますか？(1枚以上)'
  Poker.new(gets.to_i).game
end


dealer.rb
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
        @prayers_hand << [score_check(prayer_hand[0]),prayer_hand[1]]
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


deck.rb
class Deck

  CARD = Hash["1"=>"A","13"=>"K","12"=>"Q","11"=>"J"]

  def initialize
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
    @deck52 = @deck52.shuffle.shuffle
  end

end


prayer.rb
require './card'
require './hand'

class Prayer
  attr_reader :hand

  def initialize(hand,prayer_number)
    @prayer_card = hand
    @prayer_number = prayer_number
  end

  def cards
    card = Card.new(@prayer_card)
    card_score = [card.has_same_suits?,
                   card.numbers_of_the_same_rank,
                   card.has_serial_number?]
    hand_rank = Hand.new(card_score)
    p "prayer#{@prayer_number}"
    p [hand_rank.judg_score_card,card.unit]
  end

end


card.rb
class Card
  attr_reader :hand

  HAND = Hash["A"=>"14","K"=>"13","Q"=>"12","J"=>"11", 14=>1]

  def initialize(hand)
    if hand.size == 1
      @suit = hand.flatten[0]
      @rank = hand.flatten[1]
    elsif hand.size > 1
      @suit = hand.transpose[0]
      @rank = hand.transpose[1]
    end
  end

  def notation
    "#{@rank}#{@suit}"
  end

  def numbers_of_the_same_rank
    same_rank_list = Array.new
    element = @rank.uniq
    element.each do |i|
      count_number = @rank.count(i)
      same_rank_list.push(count_number) if count_number > 1
    end
    same_rank_list
  end

  def has_same_suits?
    @suit.uniq.size == 1
  end

  def has_serial_number?
    rank = card_organize(@rank)
    if exception_card?(rank)
      rank = card_organize(rank)
    end
    (rank.size - 1).times do |i|
      return false if (rank[i] - rank[i + 1]) != 1
      return rank if i == (rank.size - 2)
    end
  end

  def unit
    card_organize(@rank)
  end

  def card_organize(hand)
    card = Array.new
    hand.size.times do |i|
      card.push(design(hand[i]))
    end
    card.sort.reverse
  end

  def exception_card?(card)
    card.size.downto(2) do |i|
      return true if card.include?(i)
      return false if i == 2 && !card.include?(i)
    end
  end

  def design(number)
    case number
      when "A","K","Q","J",14 then
        HAND[number].to_i
      else
        number.to_i
    end
  end

end


hand.rb
class Hand
  attr_reader :hand

  def initialize(hand)
    @has_suit = hand[0]
    @number_of_the_same_rank = hand[1]
    @has_continuation = hand[2]
  end

  def judg_score_card
    if @has_continuation
      serial_card
    elsif !@has_suit && @number_of_the_same_rank.size == 1
      one_set_of_same_rank
    elsif !@has_suit && @number_of_the_same_rank.size == 2
      two_sets_of_same_rank
    elsif @has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      "flush"
    elsif !@has_suit && @number_of_the_same_rank.size == 0 && !@has_continuation
      "high card"
    end
  end

  def one_set_of_same_rank
    if @number_of_the_same_rank[0] == 4
      "four of a kind"
    elsif @number_of_the_same_rank[0] == 3
      "three of a kind"
    elsif @number_of_the_same_rank[0] == 2
      "one pair"
    end
  end

  def two_sets_of_same_rank
    if @number_of_the_same_rank.inject{|sum, i| sum + i} == 4
      "two pair"
    elsif @number_of_the_same_rank.inject{|sum, i| sum + i} == 5
      "full house"
    end
  end

  def serial_card
    if @has_suit
      if @has_continuation.inject{|sum, i| sum + i} == 60
        "royal flush"
      else
        "straight flush"
      end
    elsif !@has_suit
      "straight"
    end
  end

end


howdown.rb
class Showdown
  attr_reader :hands

  def initialize(hands)
    prayer1_cards = hands[0]
    @prayer1hand = prayer1_cards[0]
    @prayer1ranks = prayer1_cards[1]
    prayer2_cards = hands[1]
    @prayer2hand = prayer2_cards[0]
    @prayer2ranks = prayer2_cards[1]
  end

  def showdown
    result = win(@prayer1hand,@prayer2hand)
    if result == "drow"
      result = drow_case
    end
    result
  end

  def drow_case
    @prayer1ranks.size.times do |i|
      result = win(@prayer1ranks[i],@prayer2ranks[i])
      break result if result != "drow"
      break result if i == (@prayer1ranks.size - 1)
    end
  end

  def win(prayer1,prayer2)
    if prayer1 > prayer2
      "winer prayer1"
    elsif prayer1 < prayer2
      "winer prayer2"
    elsif prayer1 == prayer2
      "drow"
    end
  end

end
