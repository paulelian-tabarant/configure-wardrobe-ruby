# frozen_string_literal: true

class GardeRobe
  def initialize(largeur)
    @largeur = largeur
  end

  def combinaisons(elements)
    combinaisons = []

    elements.each do |element|

      elements.each do |autre_element|
        candidats = combinaisons_avec(element, autre_element)

        candidats.each do |candidat|
          combinaisons << candidat unless combinaisons.include?(candidat)
        end
      end

    end

    combinaisons
  end

  private

  def combinaisons_avec(element, autre_element)
    combinaisons = []

    (0..max_elements(element)).each do |n|
      combinaisons += combinaisons_avec_n_fois(n, element, autre_element)
    end

    combinaisons
  end

  def combinaisons_avec_n_fois(n, element, autre_element)
    combinaisons = []

    (0..max_elements(autre_element)).each do |m|
      essai = combiner([element] * n + [autre_element] * m)
      combinaisons << essai if fit?(essai)
    end

    combinaisons
  end

  def fit?(essai)
    essai.largeur == @largeur
  end

  def max_elements(element)
    @largeur / element
  end

  def combiner(elements)
    Combinaison.new(elements)
  end

end
