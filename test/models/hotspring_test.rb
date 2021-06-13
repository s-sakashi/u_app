require "test_helper"

class HotspringTest < ActiveSupport::TestCase

  def setup
    @hotspring = Hotspring.new(name: "道後温泉")
  end

end
