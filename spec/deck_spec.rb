# frozen_string_literal: true

require_relative '../lib/card'
require_relative '../lib/deck'
require 'rspec'

describe Deck do
  let(:first_card) { Card.new('What is the capital of Alaska?', 'Juneau', :Geography) }
  let(:second_card) { Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :STEM) }
  let(:third_card) { Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :STEM) }
  let(:cards) { [first_card, second_card, third_card] }
  let(:deck) { described_class.new(cards) }

  describe '#initialize' do
    subject(:deck) { described_class.new(cards) }

    it { is_expected.to be_instance_of(described_class) }
  end

  describe '#cards' do
    subject(:deck_cards) { deck.cards }

    it { is_expected.not_to be_nil }

    it 'returns array of cards' do
      expect(deck_cards).to eq([first_card, second_card, third_card])
    end
  end

  describe '#count' do
    subject(:count) { deck.count }

    it { is_expected.not_to be_nil }

    it 'returns card count' do
      expect(deck.count).to eq(3)
    end
  end

  describe '#cards-in-category' do
    subject(:category) { deck.cards_in_category(:STEM) }

    context 'when category is present' do
      it 'returns array of cards in category' do
        expect(deck.cards_in_category(:STEM)).to eq([second_card, third_card])
      end
    end

    context 'when category is not present' do
      it 'returns empty array' do
        cards = [Card.new('What is the capital of Alaska?', 'Juneau', :Geography),
                 Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', :Fantasy),
                 Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', :Fantasy)]
        deck = described_class.new(cards)

        expect(deck.cards_in_category(:STEM)).to eq([])
      end
    end
  end

  describe '#categories' do
    context 'when category is a symbol' do
      it 'returns array of category symbols' do
        expect(deck.categories).to eq(%i[Geography STEM])
      end
    end

    context 'when category is a string' do
      it 'returns array of category strings' do
        cards = [Card.new('What is the capital of Alaska?', 'Juneau', 'Geography'),
                 Card.new('The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?', 'Mars', 'STEM'),
                 Card.new('Describe in words the exact direction that is 697.5° clockwise from due north?', 'North north west', 'STEM')]
        deck = described_class.new(cards)

        expect(deck.categories).to eq(%w[Geography STEM])
      end
    end
  end
end
