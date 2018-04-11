require './card'
require './hand'

describe Hand do
  describe 'hand' do
    describe 'judg_score_card' do
      context '3♠  and A♠ ' do
        card = [["♠", "3"],
                ["♠", "A"]]
        cards1 = Card.new(card)
        hand = [cards1.has_same_suits?,
                cards1.numbers_of_the_same_rank,
                cards1.has_same_connections?]
        let(:call) { Hand.new(hand) }
        it '役判定 flush' do
          expect(call.judg_score_card).to eq "flush"
        end
      end

      context 'A♠  and A◆ ' do
        card = [["♠", "A"],
                ["◆", "A"]]
        cards2 = Card.new(card)
        hand = [cards2.has_same_suits?,
                cards2.numbers_of_the_same_rank,
                cards2.has_same_connections?]
        let(:call) { Hand.new(hand) }
        it '役判定 pair' do
          expect(call.judg_score_card).to eq "pair"
        end
      end

      context 'A◆  and 3♠ ' do
        card = [["♠", "3"],
                ["◆", "A"]]
        cards3 = Card.new(card)
        hand = [cards3.has_same_suits?,
                cards3.numbers_of_the_same_rank,
                cards3.has_same_connections?]
        let(:call) { Hand.new(hand) }
        it '役判定 high card' do
          expect(call.judg_score_card).to eq "high card"
        end
      end

      context 'A◆  and K◆ ' do
        card = [["◆", "K"],
                ["◆", "A"]]
        cards4 = Card.new(card)
        hand = [cards4.has_same_suits?,
                cards4.numbers_of_the_same_rank,
                cards4.has_same_connections?]
        let(:call) { Hand.new(hand) }
        it '役判定　straight flush' do
          expect(call.judg_score_card).to eq "straight flush"
        end
      end

      context 'A♠ and 2♥' do
        card = [["♥", "2"],
                ["♠", "A"]]
        cards5 = Card.new(card)
        hand = [cards5.has_same_suits?,
                cards5.numbers_of_the_same_rank,
                cards5.has_same_connections?]
        let(:call) { Hand.new(hand) }
        it '役判定　straight' do
          expect(call.judg_score_card).to eq "straight"
        end
      end
    end
  end

end