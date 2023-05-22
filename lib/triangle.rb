class Triangle
  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    validate_triangle
  end

  def kind
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side1 == side3 || side2 == side3
      :isosceles
    else
      :scalene
    end
  end

  private

  def validate_triangle
    validate_positive_lengths
    validate_triangle_inequality
  end

  def validate_positive_lengths
    raise TriangleError, "Invalid triangle sides" unless side1 > 0 && side2 > 0 && side3 > 0
  end

  def validate_triangle_inequality
    raise TriangleError, "Invalid triangle sides" unless side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  class TriangleError < StandardError
    # Custom error class for invalid triangles
  end
end
