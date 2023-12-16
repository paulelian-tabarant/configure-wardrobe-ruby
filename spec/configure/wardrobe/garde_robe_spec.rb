# frozen_string_literal: true

require_relative "../../../src/configure/wardrobe/garde_robe"

# aucun element dans la garde robe -> []
# un élément candidat pour la taille donnée -> N fois cet élément
# un élément candidat et un autre qui ne rentre pas -> N fois l'élément candidat
# deux éléments candidats -> N fois la combinaison de chaque, + la combinaison possible entre les 2
# trois éléments candidats

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
      rangements = [250, 25]
      n_fois_chaque_rangement = [[250], [25, 25, 25, 25, 25, 25, 25, 25, 25, 25]]
      # quand
      combinaisons = @garde_robe.combinaisons(rangements)
      # alors
      expect(combinaisons).to eq(n_fois_chaque_rangement)
    end

    it "est capable d'exclure les rangements non compatibles" do
      # étant donné
      rangement_non_compatible = [21]
      # quand
      combinaisons = @garde_robe.combinaisons(rangement_non_compatible)
      # alors
      expect(combinaisons).to eq([])
    end

    it "donne toutes les sommes exactes possibles de deux rangements" do
      # étant donné
      @garde_robe = GardeRobe.new(1000)
      rangements_qui_remplissent_2_par2 = [501, 502, 503, 497, 498, 499]

      # quand
      combinaisons = @garde_robe.combinaisons(rangements_qui_remplissent_2_par2)

      # alors
      expect(combinaisons.size).to eq(3)
      expect(combinaisons).to include([501, 499].sort)
      expect(combinaisons).to include([502, 498].sort)
      expect(combinaisons).to include([503, 497].sort)
    end

    it "donne les combinaisons de n fois un élément et m fois un autre" do
      # étant donné
      @garde_robe = GardeRobe.new(1000)
      rangements_qui_remplissent_2_par2 = [425, 150, 550]

      # quand
      combinaisons = @garde_robe.combinaisons(rangements_qui_remplissent_2_par2)

      # alors
      expect(combinaisons.size).to eq(2)
      expect(combinaisons).to include([425, 425, 150].sort)
      expect(combinaisons).to include([150, 150, 150, 550].sort)
    end
  end
end
