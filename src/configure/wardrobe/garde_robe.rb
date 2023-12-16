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
    sortie = []

    (0..max_elements(element)).each do |m|
      sortie += combinaisons_avec_n_fois(m, element, autre_element)
    end

    sortie
  end

  def combinaisons_avec_n_fois(m, element, autre_element)
    sortie = []

    (0..max_elements(autre_element)).each do |n|
      essai = combiner([element] * m + [autre_element] * n)
      sortie << essai if fit?(essai)
    end

    sortie
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
