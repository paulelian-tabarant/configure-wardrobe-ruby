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
          combinaison = Combinaison.new([element] * n + [other_element])
          if essai == @largeur && !combinaisons.include?(combinaison)
            combinaisons << combinaison
          end
        end

        combinaison = Combinaison.new([element, other_element])

        if (@largeur - (element + other_element)).zero? && !combinaisons.include?(combinaison)
          combinaisons << combinaison
        end
      end

      next if @largeur % element != 0

      nombre_elements = @largeur / element
      combinaisons << Combinaison.new([element] * nombre_elements)
    end

    combinaisons
  end
end
