require 'rubygems'
require 'RMagick'
include Magick

class Film
  
  def initialize(w, h, ofile_name)
    @width = w
    @height = h
    @ofile_name = ofile_name
    @image = Image.new(@width, @height) { self.background_color = 'black' }
  end

  def output
    @image.display
  end

  def commit(sample, color)
    x = sample.image_space.x
    y = sample.image_space.y
    pixel = Pixel.new(color.r * QuantumRange,
                      color.g * QuantumRange, 
                      color.b * QuantumRange, 1.0)
    @image.pixel_color(x, y, pixel)
  end

end
