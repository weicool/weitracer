require 'utilities'

class Sample

  attr_accessor :world_space, :image_space

  def initialize(wspace, ispace)
    @world_space = wspace
    @image_space = ispace
  end

end


class Sampler

  def initialize(width, height, top_left, top_right, bot_left, bot_right)
    @width = width
    @height = height
    @top_left = top_left
    @top_right = top_right
    @bot_left = bot_left
    @bot_right = bot_right
  end

  def samples
    (0...@width).each do |x|
      (0...@height).each do |y|
        image_space = Vector[x, y]

        u = (x+0.5) / @width
        v = (y+0.5) / @height

        left = @bot_left*(1-v) + @top_left*v
        right = @bot_right*(1-v) + @top_right*v
        world_space = left*(1-u) + right*u

        yield Sample.new(world_space, image_space)
      end
    end
  end

end

