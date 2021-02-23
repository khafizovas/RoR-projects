# frozen_string_literal: true

class Line
  attr_reader :x1, :x2, :y1, :y2, :line_func

  def initialize(x1, y1, x2, y2)
    @x1 = x1
    @x2 = x2
    @y1 = y1
    @y2 = y2

    @line_func = lambda do |x, y|
      (y1 - y2) * x + (x2 - x1) * y + x1 * y2 - x2 * y1
    end
  end

  def include_point?(x, y)
    line_func.call(x, y).zero?
  end
end

class ThickLine < Line
  attr_reader :thickness

  def initialize(x1, y1, x2, y2, thickness)
    super x1, y1, x2, y2
    @thickness = thickness
  end

  def include_point?(x, y)
    line_func.call(x, y).abs.to_f / Math.sqrt((y1 - y2)**2 + (x2 - x1)**2) <= thickness / 2.0
  end
end
