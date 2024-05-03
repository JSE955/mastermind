class Peg
  CODE_COLORS = ['red', 'blue', 'green', 'yellow', 'orange', 'purple']
  KEY_COLORS = ['black', 'white']
  attr_reader :color

  def initialize(color)
    @color = color
  end
end