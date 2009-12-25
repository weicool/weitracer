class BRDF

  attr_accessor :kd, :ks, :ka, :kr, :sp
  
  def initialize
  end

  def initialize(kd=nil, ks=nil, ka=nil, kr=nil, sp=0.0)
    @kd = kd
    @ks = ks
    @ka = ka
    @kr = kr
    @sp = sp
  end

end
