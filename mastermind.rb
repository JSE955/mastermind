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
    @all_guesses = []
  end

  def display_board
    all_guesses.each_with_index do |elem, index|
      if index.even?
        puts "Guess - " + elem.to_s + " | Feedback - #{all_guesses[index + 1].to_s}"
      end
    end
  end


  def guess_secret_code
    user_guess = []
    user_guess.push(prompt_for_code_color) until user_guess.length == 4
    all_guesses.push(user_guess)
    user_guess
  end

  def check_guess(guess)
    if guess == secret_code
      puts 'YOU WIN!'
      return
    end
    feedback = []
    guess.each_with_index do |elem, i|
      if elem.color == secret_code[i].color
        feedback.push(Peg.new('black'))
      elsif secret_code.any? {|peg| peg.color == elem.color }
        feedback.push(Peg.new('white'))
      else
        feedback.push(nil)
      end
    end
    all_guesses.push(feedback)
  end

  private

  def prompt_for_turns
    puts 'Welcome to Mastermind. How many turns for this game?'
    gets.chomp.to_i
  end

  def prompt_for_code_color
    puts "Enter Number for Peg Color - Red (1), Blue (2), Green (3), Yellow (4), Orange (5), Purple (6)"
    color = gets.chomp.to_i
    case color
    when 1 then return Peg.new(Peg.code_colors[0])
    when 2 then return Peg.new(Peg.code_colors[1])
    when 3 then return Peg.new(Peg.code_colors[2])
    when 4 then return Peg.new(Peg.code_colors[3])
    when 5 then return Peg.new(Peg.code_colors[4])
    when 6 then return Peg.new(Peg.code_colors[5])
    end
  end

  def generate_secret_code
    secret_code = []
    4.times do
      secret_code.push(Peg.new(Peg.code_colors.sample))
    end
    secret_code
  end
end
