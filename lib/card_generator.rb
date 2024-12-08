# frozen_string_literal: true

require_relative 'card'
# Reads cards from a file
class CardGenerator
  attr_reader :cards

  def initialize(filename) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    @cards = []
    File.open(filename, 'r').each_line do |line|
      next if line.empty? || line.start_with?('#')

      card_array = line.split(',')
      @cards << if card_array.size == 2
                  Card.new(card_array[0], card_array[1].chomp)
                elsif card_array.size == 3
                  Card.new(card_array[0], card_array[1], card_array[2].chomp)
                elsif card_array.size >= 4
                  answers = []
                  index = 2
                  (card_array.size - 2).times do
                    answers << card_array[index]
                    index += 1
                  end
                  answers.last.chomp!
                  Card.new(card_array[0], card_array[1], answers)
                else
                  next
                end
    end
  end
end
