class Card
  attr_reader :suit, :rank

  HAND = {"A"=>"14", "K"=>"13", "Q"=>"12", "J"=>"11", 14=>1}

  def initialize(suit,rank)
    @suit = suit
    @rank = rank
  end

  def notation
    "#{@rank}#{@suit}"
  end

  def has_same_rank
    count_list = Array.new
    number_list = Array.new
    same_rank = @rank.group_by{ |i| i}.reject{ |k, v| v.one?}.keys
    same_rank.each { |i|
      count_list.push(@rank.count(i))
      number_list.push(design(i))
    }
    return count_list,number_list
  end

  def has_same_suit?
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

  def card_organize(card)
    rank = Array.new
    card.each { |i|
      rank.push(design(i))
    }
    rank.sort.reverse
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