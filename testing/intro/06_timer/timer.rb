class Timer
  attr_accessor :seconds
  
  def initialize
  	@seconds=0
  end

  def time_string
  	mm,ss=seconds.divmod(60)
  	hh,mm=mm.divmod(60)
  	t=[hh.to_s.rjust(2,'0'),mm.to_s.rjust(2,'0'),ss.to_s.rjust(2,'0')]
  	t.join(":")
  end
end
