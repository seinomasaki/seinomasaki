require './dealer'

class Poker
  attr_reader :number_of_card

  def initialize(number_of_card)
    @dealer = Dealer.new(number_of_card)
  end

  def game
    1.upto(30) do |i|
      puts "-------","game#{i}"
      @dealer.deal
      sleep(2)
    end
  end

end

if $PROGRAM_NAME == __FILE__
  p '手札を何枚にしますか？(1枚以上)'
  Poker.new(gets.to_i).game
end
