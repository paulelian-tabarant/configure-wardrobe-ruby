class Combinaison
  attr_reader :elements

  def initialize(elements)
    @elements = elements
  end

  def ==(other)
    @elements.sort == other.elements.sort
  end
end
