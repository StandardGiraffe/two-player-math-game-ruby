class Impressario

  attr_reader :which_round, :active_player

  def initialize
    @active_player = nil
    @players = []
    @which_round = 0
  end

  # starts the game and begins looping through rounds.
  def run_game

    puts "Welcome to the extremely challenging addition game!"
    puts "Player 1, your name? "
    player1 = Player.new(gets.chomp)
    puts "... And you, Player 2? "
    player2 = Player.new(gets.chomp)

    puts "Welcome, #{player1.name} and #{player2.name}!"

  end

  def increment_round!
    @which_round += 1
  end

  # Checks the active player against @players and mutates @active_player to the other value
  def switch_player!(active_player)

  end

  #concludes the game, reporting the winner
  def end_game

  end

  # Runs through a standard round for the active player
  def run_round(active_player)

  end

end