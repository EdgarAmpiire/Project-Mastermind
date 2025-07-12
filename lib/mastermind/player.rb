class Player
  def get_guess
    loop do
      print 'Enter your guess (e.g. RGBY):'
      input = gets.chomp.upcase.chars
      return input if Code.valid_guess?(input)
      puts "Invalid guess. Use 4 letters from #{Code::COLORS.join(', ')}"
    end
  end
end