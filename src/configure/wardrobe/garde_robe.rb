# frozen_string_literal: true

class GardeRobe
  def initialize(largeur)
    @largeur = largeur
  end

  def combinaisons(elements)
    combinaisons = []

    elements.each do |element|

      elements.each do |autre_element|
        next if autre_element == element

        (1..max_elements(element)).each do |n|
          essai = combinaison([element] * n + [autre_element])
          combinaisons << essai if peut_remplir?(essai) && !combinaisons.include?(essai)
        end
      end

      nombre_elements = @largeur / element
      essai = combinaison([element] * nombre_elements)
      combinaisons << essai if peut_remplir?(essai)
    end

    combinaisons
  end

  private

  def peut_remplir?(essai)
    essai.largeur == @largeur
  end

  def max_elements(element)
    @largeur / element
  end

  def combinaison(elements)
    Combinaison.new(elements)
  end

end
