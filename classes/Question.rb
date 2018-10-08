class Question

  def initialize
    @first_number = rand(1..20)
    @second_number = rand(1..20)
    @correct_answer = @first_number + @second_number
  end

  def display_question
    "What's #{@first_number} + #{@second_number}?"
  end

  def answer?(guess)
    guess == @correct_answer
  end

end