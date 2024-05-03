class Peg
  CODE_COLORS = ['red', 'blue', 'green', 'yellow', 'orange', 'purple'].freeze
  KEY_COLORS = ['black', 'white'].freeze
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def self.code_colors
    CODE_COLORS
  end

  def self.key_colors
    KEY_COLORS
  end
end

class Game
  attr_accessor :secret_code, :turns, :all_guesses, :guess, :feedback

  def initialize
    @turns = prompt_for_turns
    @secret_code = generate_secret_code
  end

  private

  def prompt_for_turns
    puts 'Welcome to Mastermind. How many turns for this game?'
    gets.chomp.to_i
  end

  def generate_secret_code
    secret_code = []
    4.times do
      secret_code.push(Peg.new(Peg.code_colors.sample))
    end
    secret_code
  end
end
