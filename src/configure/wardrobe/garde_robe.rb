# frozen_string_literal: true

class GardeRobe
  def initialize(largeur)
    @largeur = largeur
  end

  def combinaisons(elements)
    [] if elements == []

    resultat = []
    elements.each do |element|
      nombre_elements = @largeur / element
      resultat << [element] * nombre_elements
    end

    resultat
  end
end
