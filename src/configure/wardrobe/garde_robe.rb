# frozen_string_literal: true

class GardeRobe
  def initialize(largeur)
    @largeur = largeur
  end

  def combinaisons(elements)
    résultat = []
    elements.each do |element|
      next if @largeur % element != 0

      nombre_elements = @largeur / element
      résultat << [element] * nombre_elements
    end

    résultat
  end
end
