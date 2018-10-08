class Question

  attr_reader :correct_answer

  def initialize
    @first_number = rand(1..20)
    @second_number = rand(1..20)
    @correct_answer = @first_number + @second_number
  end

  def display_question
    "what's #{@first_number} + #{@second_number}?"
  end

  def correct?(guess)
    guess == @correct_answer
  end

end