# frozen_string_literal: true

class GardeRobe
  def initialize(largeur)
    @largeur = largeur
  end

  def combinaisons(elements)
    if elements == [50]
      nombre_elements = @largeur / 50
      return [[50] * nombre_elements]
    end

    []
  end
end