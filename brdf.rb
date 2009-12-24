class BRDF

  attr_reader :kd, :ks, :ka, :kr, :sp

  def initialize(kd, ks, ka, kr, sp)
    @kd = kd
    @ks = ks
    @ka = ka
    @kr = kr
    @sp = sp
  end

end
