require_relative "code"
require_relative "player"

class Game
  MAX_TURNS = 12
  
  def initialize
    @code = Code.new
    @player = Player.new
  end

  def play
    puts "🎯 Welcome to Mastermind!"
    puts "Guess the 4-color code. Possible colors:#{Code::COLORS.join(', ')}"
    puts "You have #{MAX_TURNS} turns. Feedback: ⚫ = color+position, ⚪ = right color only."

    MAX_TURNS.times do |turn|
      puts "\nTurn#{turn + 1}: "
      guess = @player.get_guess
      black, white = @code.feedback(guess)

      if black == 4
        puts "🎉 You cracked the code in #{turn + 1} turns!"
        return
      else
        puts "Feedback:  ⚫ #{black}, ⚪ #{white}"
      end
    end
    puts "\nYou ran out of turns. The secret code was: #{@code.secret.join}"
  end
end