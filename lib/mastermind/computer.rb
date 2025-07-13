class Computer
  def initialize
    @previous_game = []
    @known_colors = []
  end

  def make_guess(previous_guesses)
    if previous_guesses.empty?
      return 4.times.map{Code::COLORS.sample}
    end
    last = previous_guesses.last
    last_guess = last[:guess]
    black, white = last[:feedback]

    #retain known correct colors (black + white pegs)
    @known_colors += last_guess.select {|color| Code::COLORS.include?(color)}
    @known_colors = @known_colors.uniq

    new_guess = Array.new(4) do |i|
      # Randomly place known colors or guess randomly
      if @known_colors[i]
        @known_colors.sample
      else
        Code::COLORS.sample
      end
    end

    new_guess
  end
end