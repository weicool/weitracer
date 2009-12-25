require 'utilities'
require 'shape'
require 'light'

class Parser

  attr_reader :width, :height, :camera_loc,
    :top_left, :top_right, :bot_left, :bot_right,
    :shapes, :lights

  def initialize(ifile_name)
    @ifile_name = ifile_name
    
    @width = 300
    @height = 300
    @camera_loc = Vector[0.0, 0.0, 0.0]
    @top_left = Vector[-1.0, 1.0, -3.0]
    @top_right = Vector[1.0, 1.0, -3.0]
    @bot_left = Vector[-1.0, -1.0, -3.0]
    @bot_right = Vector[1.0, -1.0, -3.0]
    @shapes = ShapeList.new
    @lights = []
  end
  
  def parse
    File.open(@ifile_name, 'r') do |file|
      while line = file.gets
        keyword = line.strip.split[0]
        case keyword
        when 'scene'
          parse_scene(file)
        end
      end
    end
    
    debug "width: #{@width}, height: #{height}"
    debug "camera_loc: #{@camera_loc}"
    debug "ul: #{@top_left}, ur: #{@top_right}"
    debug "ll: #{@bot_left}, lr: #{@bot_right}"
  end

  private

  def parse_scene(file)
    while line = file.gets
      line = line.strip.split
      property = line[0]
      case property
      when 'size'
        @width = line[1].to_i
        @height = line[2].to_i
      when 'cam'
        @camera_loc = Vector.elements(line[1..-1].map {|n| n.to_f})
      when 'ul', 'ur', 'll', 'lr'
        corner = {'ul'=>:@top_left, 'ur'=>:@top_right,
                  'll'=>:@bot_left, 'lr'=>:@bot_right}[property]
        self.instance_variable_set(corner, Vector.elements(line[1..-1].map {|n| n.to_f}))
      when '}'
        return
      end
    end
  end

end
