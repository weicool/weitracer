require 'rubygems'
require 'RMagick'
include Magick

class Film
  
  def initialize(w, h, ofile_name)
    @width = w
    @height = h
    @ofile_name = ofile_name
    @film = [[Color[0.0, 0.0, 0.0, 0.0]] * @width] * @height
  end

  def output
    # test image writing
    image = Image.new(@width, @height) { self.background_color = 'black' }
    (0...@width).each do |x|
      (0...@height).each do |y|
        color = @film[y][x]
        pixel = Pixel.new(color.r * QuantumRange,
                          color.g * QuantumRange, 
                          color.b * QuantumRange, 1.0)
        image.pixel_color(x, y, pixel)
      end
    end
    image.display
  end

  def commit(sample, color)
    x = sample.image_space.x
    y = sample.image_space.y
    @film[y][x] = color
  end

end
