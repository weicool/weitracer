require 'rubygems'
require 'RMagick'
include Magick

class Film
  
  def initialize(w, h, ofile_name)
    @width = w
    @height = h
    @ofile_name = ofile_name
    @film = [[Color[0.0, 0.0, 0.0, 0.0]] * @width] * @height
    @image = Image.new(@width, @height) { self.background_color = 'black' }
  end

  def output
    @image.display
  end

  def commit(sample, color)
    x = sample.image_space.x
    y = sample.image_space.y
    pixel = Pixel.new(color[0] * QuantumRange,
                      color[1] * QuantumRange, 
                      color[2] * QuantumRange, 1.0)
    @image.pixel_color(x, y, pixel)
  end

end
