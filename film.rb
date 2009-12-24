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
    @image.flip.display
  end

  def commit(sample, color)
    x = sample.image_space.x
    y = sample.image_space.y
    pixel = Pixel.new([color.r, 1.0].min * QuantumRange,
                      [color.g, 1.0].min * QuantumRange, 
                      [color.b, 1.0].min * QuantumRange, 1.0)
    @image.pixel_color(x, y, pixel)
  end

end
