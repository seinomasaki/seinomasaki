require './card'
require './hand'
require './cardopen'


describe Cardopen do
  describe 'open' do
    deck1 = [["♠","1"],
             ["♣","3"],
             ["◆","4"]]

    deck2 = [["♥","2"],
             ["♠","3"],
             ["◆","5"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:high card ♠1♣3◆4, p2:high card ♥2♠3◆5 ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1<p2' do
        expect(cardrank.open).to eq "prayer2"
      end
    end

    deck1 = [["♠","2"],
             ["♣","3"],
             ["♥","5"]]

    deck2 = [["♥","2"],
             ["♠","3"],
             ["◆","5"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:high card ♠2♣3◆5, p2:high card ♥2♠3◆5 ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1=p2' do
        expect(cardrank.open).to eq "drow"
      end
    end

    deck1 = [["♠","2"],
             ["♠","3"],
             ["♠","5"]]

    deck2 = [["♥","2"],
             ["♥","3"],
             ["♥","5"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:flush ♠2♠3♠5, p2:flush ♥2♥3♥5 ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1=p2' do
        expect(cardrank.open).to eq "drow"
      end
    end

    deck1 = [["♠","2"],
             ["♠","3"],
             ["♠","A"]]

    deck2 = [["♥","2"],
             ["♥","3"],
             ["♥","5"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:flush ♠2♠3♠A, p2:flush ♥2♥3♥5 ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end

    deck1 = [["♠","K"],
             ["♠","Q"],
             ["♠","A"]]

    deck2 = [["♥","K"],
             ["♣","K"],
             ["◆","K"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:straight flush ♠K♠Q♠A, p2:three of a kind ♥K♣K◆K ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end

    deck1 = [["♠","K"],
             ["♠","Q"],
             ["♠","A"]]

    deck2 = [["♥","K"],
             ["♥","Q"],
             ["♥","J"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:straight flush ♠K♠Q♠A, p2:straight flush ♥K♥Q♥J ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]
      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end

    deck1 = [["♠","K"],
             ["♥","2"],
             ["♠","A"]]

    deck2 = [["♥","K"],
             ["♠","Q"],
             ["♥","J"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:high card ♠K♥2♠A, p2:straight ♥K♠Q♥J ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1<p2' do
        expect(cardrank.open).to eq "prayer2"
      end
    end

    deck1 = [["♠","K"],
             ["♥","A"],
             ["♠","A"]]

    deck2 = [["♥","K"],
             ["♣","K"],
             ["◆","K"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:pair ♠K♥A♠A, p2:three if a kind ♥K♣K◆K ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1<p2' do
        expect(cardrank.open).to eq "prayer2"
      end
    end

    deck1 = [["♠","K"],
             ["♠","Q"],
             ["♥","A"]]

    deck2 = [["♥","K"],
             ["♥","Q"],
             ["♠","J"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:straight ♠K♠Q♥A, p2:straight ♥K♥Q♠J ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]
      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]
      p prayer2
      p hands
      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end

    deck1 = [["♠","K"],
             ["♠","Q"],
             ["♠","A"]]

    deck2 = [["♥","3"],
             ["♥","2"],
             ["♥","A"]]

    card = [Card.new(deck1),
            Card.new(deck2)]

    context 'prayerの役の比較 / p1:straight flush ♠K♠Q♠A, p2:straight flush ♥3♥2♥A ' do
      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_same_connections?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_same_connections?]
      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_three_card,
               card[0].unit,
               cards[1].judg_three_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end
  end

end
