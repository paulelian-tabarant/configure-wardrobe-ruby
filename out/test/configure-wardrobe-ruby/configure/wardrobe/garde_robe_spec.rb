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

    it "renvoie une liste de 5 éléments de 50cm quand des éléments de 50cm sont disponibles" do
      # étant donné
      element_de_50cm = [50]
      cinq_fois_cet_element = [[50, 50, 50, 50, 50]]
      # quand
      combinaisons = @garde_robe.combinaisons(element_de_50cm)
      # alors
      expect(combinaisons).to eq(cinq_fois_cet_element)
    end

    it "renvoie toutes les combinaisons d'un même rangement s'il peut remplir la garde-robe" do
      # étant donné
      rangements = [50, 250, 25]
      n_fois_chaque_rangement = [[50, 50, 50, 50, 50], [250], [25, 25, 25, 25, 25, 25, 25, 25, 25, 25]]
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

    it "combine deux éléments qui permettent de remplir la largeur de la garde-robe" do
      # étant donné
      rangement_non_compatible = [50, 200]
      # quand
      combinaisons = @garde_robe.combinaisons(rangement_non_compatible)
      # alors
      combinaisons.at(0).should =~ [50, 50, 50, 50, 50]
      combinaisons.at(1).should =~ [50, 200]
    end
  end
end
