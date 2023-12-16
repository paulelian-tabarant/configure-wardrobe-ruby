class Combinaison
  attr_reader :elements

  def initialize(elements)
    @elements = elements
  end

  def largeur
    @elements.sum
  end

  def ==(other)
    @elements.sort == other.elements.sort
  end
end
