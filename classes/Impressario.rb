class Impressario

  attr_reader     :which_round, :active_player
  attr_accessor   :question_cap

  def initialize
    @active_player = nil
    @players = []
    @which_round = 0
    @question_cap = 20
  end

  # starts the game and begins looping through rounds.
  def run_game

    puts "Welcome to the extremely challenging addition game!"

    print "Player 1, your name? "
    player1 = Player.new(gets.chomp)
    @players << player1

    print "... And you, Player 2? "
    player2 = Player.new(gets.chomp)
    @players << player2

    puts "Welcome, #{player1.name} and #{player2.name}!\n\n"

    @active_player = @players[rand(0..1)]
    puts "According to my coin-flip, #{@active_player.name} is going... SECOND!  Sorry to disappoint you.\n\n\n"

    while (@active_player.lives > 0)
        run_round
    end

    end_game
  end

  def increment_round!
    @which_round += 1
  end

  # Checks the active player against @players and mutates @active_player to the other value
  def switch_player!
    if (@active_player == @players[0])
      @active_player = @players[1]
    else
      @active_player = @players[0]
    end

  end

  #concludes the game, reporting the winner
  def end_game
    puts "\n\n______________________ GAME OVER ______________________"
    puts "#{@active_player.name}, you've run out of lives.  You're right dead."
    switch_player!
    puts "#{@active_player.name}, you had #{@active_player.lives} #{(@active_player.lives) == 1 ? "life" : "lives"} remaining, and win!\nBy which we mean, you didn't die.\nRight now.\n\nGood.\n\n\n"
  end

  # Runs through a standard round for the active player
  def run_round
        increment_round!
        switch_player!
        question = Question.new(@question_cap)
        puts "________ Question #{@which_round} ________"
        puts "#{@active_player.name}, you have #{@active_player.lives} lives remaining.\n"
        print "#{@active_player.name}, #{question.display_question} "
        answer = gets.chomp.to_i
        if question.correct?(answer)
          puts "Well done, #{@active_player.name}!  #{answer} was the correct answer.  You don't die today.\nSo, let's make the questions HARDER.\n\n"
          @question_cap = (@question_cap*rand(1.0..2.5)).to_i
        else
          puts "Yegads, #{answer}?!  Nope, nope, nope.  It was #{question.correct_answer}.  You DIE!  (Once.)\n\n"
          @active_player.lose_life
        end
    end
end