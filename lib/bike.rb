class Bike
  def initialize(status = false)
    @broken = status
  end

  def report_broken
    @broken = true
    self
  end

  def broken?
    @broken
  end

  def working?
    !@broken
  end
end
