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