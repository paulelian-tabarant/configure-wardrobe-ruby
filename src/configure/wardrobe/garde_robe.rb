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

        (1..@largeur / element).each do |n|
          essai = element * n + other_element
          combinaison = ([element] * n + [other_element]).sort
          if essai == @largeur && !combinaisons.include?(combinaison)
            combinaisons << ([element] * n + [other_element]).sort
          end
        end

        combinaison = [element, other_element].sort

        if (@largeur - (element + other_element)).zero? && !combinaisons.include?(combinaison)
          combinaisons << ([element, other_element]).sort
        end
      end

      next if @largeur % element != 0

      nombre_elements = @largeur / element
      combinaisons << [element] * nombre_elements
    end

    combinaisons
  end
end
