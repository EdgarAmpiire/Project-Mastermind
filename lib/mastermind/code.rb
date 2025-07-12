class Code 
  COLORS = %w[R G B Y O P] # Red Green Blue Yellow Orange Purple
  CODE_LENGTH = 4

  attr_reader :secret

  def initialize(secret = nil)
    @secret = secret || Array.new(CODE_LENGTH) { COLORS.sample}
  end

  def self.valid_guess?(guess)
    guess.length == CODE_LENGTH && guess.all? { |char| COLORS.include?(char)}
  end

  def feedback(guess)
    secret_copy = secret.dup
    guess_copy = guess.dup

    black_pegs = 0
    white_pegs = 0

    #First pass. correct color and position
    guess_copy.each_with_index do |color, i|
      if secret_copy[i] == color
        black_pegs += 1
        guess_copy[i] = nil
        secret_copy[i] = nil
      end
    end

    #Second pass. correct color, wrong position.
    guess_copy.each_with_index do |color, _|
      next unless color
      if secret_copy.include?(color)
        white_pegs += 1
        secret_copy[secret_copy.index(color)] = nil
      end
    end
    [black_pegs, white_pegs]
  end
end