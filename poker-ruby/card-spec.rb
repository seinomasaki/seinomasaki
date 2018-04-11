require './card'

describe Card do
  describe 'notation' do
    context '♠  and 3' do
      card = Card.new([["♠ ", "3"]])

      it 'should show 3♠ ' do
        expect(card.notation).to eq "3♠ "
      end
    end
  end


  describe 'has_same_suit?' do
    card1 = ["♠ ", "3"]
    card2 = ["♠ ", "A"]
    card3 = ["◆ ", "A"]

    cards1 = Card.new([card1,card2])

    context '3♠  and A♠ ' do
      it 'should be true' do
        expect(cards1.has_same_suits?).to eq true
      end
    end

    cards2 = Card.new([card1,card3])
    context 'A◆  and A♠ ' do
      it 'should be false' do
        expect(cards2.has_same_suits?).to eq false
      end
    end
  end


  describe 'has_same_rank?' do
    card1 = ["♠ ", "3"]
    card2 = ["♠ ", "A"]
    card3 = ["◆ ", "A"]

    cards3 = Card.new([card1,card2])
    context '3♠  and A♠ ' do
      it 'should be false' do
        expect(cards3.has_same_rank?).to eq false
      end
    end

    cards4 = Card.new([card2,card3])
    context 'A◆  and A♠ ' do
      it 'should be true' do
        expect(cards4.has_same_rank?).to eq true
      end
    end
    card1 = ["♠ ", "3"]
    card2 = ["♠ ", "A"]
    card3 = ["◆ ", "A"]

    cards5 = Card.new([card1,card2])
    context '3♠  and A♠ ' do
      it 'should be false' do
        expect(cards5.has_same_rank?).to eq false
      end
    end
    cards6 = Card.new([card2,card3])
    context 'A♠  and A◆ ' do
      it 'should be true' do
        expect(cards6.has_same_rank?).to eq true
      end
    end
    cards7 = Card.new([card3,card1])
    context 'A◆  and 3♠ ' do
      it 'should be false' do
        expect(cards7.has_same_rank?).to eq false
      end
    end
  end

end