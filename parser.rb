require 'utilities'

class Parser

  attr_reader :width, :height, :camera,
    :top_left, :top_right, :bot_left, :bot_right,
    :shapes, :lights

  def initialize()
    @width = 100
    @height = 100
    @camera = nil
    @top_left = Vector[-1, 1, 0]
    @top_right = Vector[1, 1, 0]
    @bot_left = Vector[-1, -1, 0]
    @bot_right = Vector[1, -1, 0]
    @shapes = []
    @lights = []
  end
  
  def parse()
    
  end
  
end