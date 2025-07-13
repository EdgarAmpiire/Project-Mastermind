require_relative "code"

class Computer
  def initialize
    @all_possible_codes = Code::COLORS.repeated_permutation(4).to_a
    @last_guess = nil
  end

  def make_guess(previous_guesses)
    if previous_guesses.empty?
      @last_guess = ["R", "G", "B", "Y"] # Deterministic first guess
      return @last_guess
    end

    # Filter possible code based on all feedback sofar
    previous_guesses.each do |entry|
      guess = entry[:guess]
      expected_feedback = entry[:feedback]

      @all_possible_codes.select! do |code|
        Code.new(code).feedback(guess) == expected_feedback
      end
    end

    @last_guess = @all_possible_codes.sample || ["R", "G", "B", "Y"]

  end
end