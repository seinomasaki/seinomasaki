require './card'
require './hand'
require './cardopen'

describe Cardopen do
  describe 'open' do
    context 'prayerの役の比較 / p1:pair ♠3♣3, p2:high card ♣3◆A ' do
      deck1 = [["♠","3"],
               ["♣","3"]]

      deck2 = [["♣","3"],
               ["◆","A"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]

      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1<p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end
    context 'prayerの役の比較 / p1:pair ♠3♣3, p2:straight flush ◆A◆2 ' do
      deck1 = [["♠","3"],
               ["♣","3"]]

      deck2 = [["◆","2"],
               ["◆","A"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]

      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]
      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1<p2' do
        expect(cardrank.open).to eq "prayer2"
      end
    end
    context 'prayerの役の比較 / p1:pair ♠3♣3, p2:pair ◆A♥A ' do
      deck1 = [["♠","3"],
               ["♣","3"]]

      deck2 = [["♥","A"],
               ["◆","A"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]
      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]
      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer2"
      end
    end
    context 'prayerの役の比較 / p1:straigh ♥A◆K, p2:straigh ◆A♥2 ' do
      deck1 = [["♥","A"],
               ["◆","K"]]

      deck2 = [["♥","2"],
               ["◆","A"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]
      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]
      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1>p2' do
        expect(cardrank.open).to eq "prayer1"
      end
    end
    context 'prayerの役の比較 / p1:high card ♠3◆A, p2:high card ♣3♥A ' do
      deck1 = [["♠","3"],
               ["◆","A"]]

      deck2 = [["♣","3"],
               ["♥","A"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]
      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]
      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1=p2' do
        expect(cardrank.open).to eq "drow"
      end
    end
    context 'prayerの役の比較 / p1:straigh ◆2♠3, p2:straigh ♣3♥2 ' do
      deck1 = [["♠","3"],
               ["◆","2"]]

      deck2 = [["♣","3"],
               ["♥","2"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]
      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]
      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1=p2' do
        expect(cardrank.open).to eq "drow"
      end
    end
    context 'prayerの役の比較 / p1:high card ◆K♠3, p2:high card ♣3◆A ' do
      deck1 = [["♠","3"],
               ["◆","K"]]

      deck2 = [["♣","3"],
               ["◆","A"]]

      card = [Card.new(deck1),
              Card.new(deck2)]

      prayer1 = [card[0].has_same_suits?,
                 card[0].numbers_of_the_same_rank,
                 card[0].has_serial_number?]
      prayer2 = [card[1].has_same_suits?,
                 card[1].numbers_of_the_same_rank,
                 card[1].has_serial_number?]

      cards = [Hand.new(prayer1),
               Hand.new(prayer2)]
      hands = [cards[0].judg_two_card,
               card[0].unit,
               cards[1].judg_two_card,
               card[1].unit]

      let(:cardrank) { Cardopen.new(hands) }
      it 'p1<p2' do
        expect(cardrank.open).to eq "prayer2"
      end
    end
  end

end
