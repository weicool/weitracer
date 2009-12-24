require 'rubygems'
require 'RMagick'
include Magick

class Film
  
  def initialize(w, h, ofile)
    @width = w
    @height = h
    @ofile_name = ofile
    @film = [[nil] * @width] * @height
  end
  
  def output
    # test image writing
    f = Image.new(100, 100) { self.background_color = "white" }
    p = Pixel.new(0.0, 0.0, 0.0, 1.0)
    (1..50).each do |x|
      (1..50).each do |y|
        f.pixel_color(x, y, "black")
      end
    end
    f.color_point(50, 50, p)
    f.display
  end
  
end
