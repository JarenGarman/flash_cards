# frozen_string_literal: true

# Defines a flashcard with a question, answer, and category.
class Card
  attr_reader :question, :answer, :category, :alternate_answer

  def initialize(question, answer, category, alternate_answer = nil)
    @question = question
    @answer = answer
    @category = category
    @alternate_answer = alternate_answer
  end
end
