require "pry"
class Airplane

  attr_reader :type, :wing_loading, :horsepower

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @engine = "off"
    @flying = "landed"
  end

  def land
    if engine_on?
      if flying?
        @flying = "landed"
        return "landing"
      end
      return "on the ground"
    end
    "no power"
  end

  def takeoff
    if engine_on?
      @flying = "flying"
      return "taking off"
    end
    "takeoff failed"
  end

  def start
    if engine_on?
      return "running"
    end
    @engine = "on"
    "started"
  end

  def engine_on?
    @engine === "on"
  end

  def flying?
    @flying === "flying"
  end
end


