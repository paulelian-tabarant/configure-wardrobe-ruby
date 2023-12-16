# frozen_string_literal: true

require_relative "../../../src/configure/wardrobe/garde_robe"
require_relative "../../../src/configure/wardrobe/combinaison"

RSpec.describe GardeRobe do
  before(:all) do
    @garde_robe = GardeRobe.new(250)
  end

  context "avec une largeur de garde-robe de 250cm" do
    it "renvoie une liste vide quand aucun élément à ajouter à l'intérieur" do
      # étant donné
      aucun_element = []
      # quand
      combinaisons = @garde_robe.combinaisons(aucun_element)
      # alors
      expect(combinaisons).to eq([])
    end

    it "renvoie toutes les combinaisons d'un même rangement s'il peut remplir la garde-robe" do
      # étant donné
      elements_qui_fit_avec_n_fois = [250, 25]

      n_fois_chaque_rangement = [
        Combinaison.new([250]),
        Combinaison.new([25, 25, 25, 25, 25, 25, 25, 25, 25, 25])
      ]
      # quand
      combinaisons = @garde_robe.combinaisons(elements_qui_fit_avec_n_fois)
      # alors
      expect(combinaisons).to eq(n_fois_chaque_rangement)
    end

    it "est capable d'exclure les rangements non compatibles" do
      # étant donné
      element_qui_ne_fit_pas = [21]
      # quand
      combinaisons = @garde_robe.combinaisons(element_qui_ne_fit_pas)
      # alors
      expect(combinaisons).to eq([])
    end

    it "donne toutes les sommes exactes possibles de deux rangements" do
      # étant donné
      @garde_robe = GardeRobe.new(1000)
      elements_qui_fit_2_par_2 = [501, 502, 503, 497, 498, 499]

      attendu = [
        Combinaison.new([501, 499]),
        Combinaison.new([502, 498]),
        Combinaison.new([503, 497])
      ]

      # quand
      combinaisons = @garde_robe.combinaisons(elements_qui_fit_2_par_2)

      # alors
      expect(combinaisons).to eq(attendu)
    end

    it "donne les combinaisons de n fois un élément et m fois un autre" do
      # étant donné
      @garde_robe = GardeRobe.new(1000)
      elements_qui_fit_2_par2 = [425, 150, 550]

      attendu = [
        Combinaison.new([425, 425, 150]),
        Combinaison.new([150, 150, 150, 550])
      ]

      # quand
      combinaisons = @garde_robe.combinaisons(elements_qui_fit_2_par2)

      # alors
      expect(combinaisons).to eq(attendu)
    end

    it "donne les combinaisons de n fois un élément et m fois un autre" do
      # étant donné
      @garde_robe = GardeRobe.new(1000)
      elements_qui_fit_avec_m_fois_l_un_et_n_fois_l_autre = [350, 60]

      attendu = [
        Combinaison.new([350, 350, 60, 60, 60, 60, 60])
      ]

      # quand
      combinaisons = @garde_robe.combinaisons(elements_qui_fit_avec_m_fois_l_un_et_n_fois_l_autre)

      # alors
      expect(combinaisons).to eq(attendu)
    end
  end
end


