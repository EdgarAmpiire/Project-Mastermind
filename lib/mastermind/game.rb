require_relative "code"
require_relative "player"
require_relative "computer"

class Game
  MAX_TURNS = 12
  
  def initialize
    @human = Player.new
    @computer = Computer.new
  end

  def play
    puts "🎯 Welcome to Mastermind!"
    puts "Available colors:#{Code::COLORS.join(', ')}"
    puts "Would you like to be the code maker or the code breaker (maker/breaker)"
    role = gets.chomp.downcase

    if role == 'breaker'
      play_as_breaker
    elsif role == 'maker'
        play_as_maker
    else
      puts "Invalid Choice. Start as breaker by default."
      play_as_breaker
    end
  end

  private

  def play_as_breaker
    secret_code = Code.new
    puts "You have #{MAX_TURNS} turns to guess the correct secret code."

    MAX_TURNS.times do |turn|
      puts "\nTurn#{turn + 1}: "
      guess = @human.get_guess
      black, white = secret_code.feedback(guess)

      if black == 4
        puts "🎉 You cracked the code in #{turn + 1} turns!"
        return
      else
        puts "Feedback:  ⚫ #{black}, ⚪ #{white}"
      end
    end
    puts "\nYou ran out of turns. The secret code was: #{secret_code.secret.join}"
  end

  def play_as_maker
    puts 'Create your secret code (e.g. RGBY):'
    secret = @human.set_secret_code
    secret_code = Code.new(secret)

    puts 'Computer will now try to guess your code...'
    possible_colors = Code::COLORS
    previous_guesses = []

    MAX_TURNS.times do |turn|
      puts "\nTurn #{turn + 1}:"
      guess= @computer.make_guess(previous_guesses)
      puts "Computer's guess: #{guess.join}"
      black, white = secret_code.feedback(guess)
      puts "Feedback: ⚫ #{black}, ⚪ #{white}"

      return puts "🤖 Computer guessed your code in #{turn + 1} turns!" if black == 4
      previous_guesses << {guess: guess, feedback: [black, white]}
    end

    puts "\n👏 You win. Computer couldn't guess your code: #{secret.join}"
  end
end