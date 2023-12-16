# frozen_string_literal: true

class GardeRobe
  def initialize(largeur)
    @largeur = largeur
  end

  def combinaisons(elements)
    combinaisons = []
    elements.each do |element|
      elements.each do |other_element|
        next if other_element == element

        if (@largeur - (element + other_element)).zero? && !combinaisons.include?([other_element, element])
          combinaisons << [element, other_element]
        end
      end

      next if @largeur % element != 0

      nombre_elements = @largeur / element
      combinaisons << [element] * nombre_elements
    end

    combinaisons
  end
end
