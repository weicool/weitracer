require 'utilities'
require 'shape'
require 'light'

class Parser

  attr_reader :width, :height, :camera_loc,
    :top_left, :top_right, :bot_left, :bot_right,
    :shapes, :lights

  def initialize(ifile_name)
    @ifile_name = ifile_name
    
    @width = 100
    @height = 100
    @camera_loc = Vector[0.0, 0.0, 0.0]
    @top_left = Vector[-1.0, 1.0, -3.0]
    @top_right = Vector[1.0, 1.0, -3.0]
    @bot_left = Vector[-1.0, -1.0, -3.0]
    @bot_right = Vector[1.0, -1.0, -3.0]
    @shapes = ShapeList.new
    @lights = []
  end
  
  def parse()
    
  end
  
end