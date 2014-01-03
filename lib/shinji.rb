require "shinji/version"

class String
  def shinji
    Shinji::to_shinji self
  end
end

module Shinji
  module_function

  def to_shinji(str)
  end
end
