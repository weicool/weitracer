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

  def generateSamples
    samples = []
    
    samples
  end

  private

  def generateSample
    
  end

end

