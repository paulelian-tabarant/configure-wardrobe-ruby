# frozen_string_literal: true

require_relative "../../../src/configure/wardrobe/garde_robe"

# aucun element dans la garde robe -> []
# un élément candidat pour la taille donnée -> N fois cet élément
# un élément candidat et un autre qui ne rentre pas -> N fois l'élément candidat
# deux éléments candidats -> N fois la combinaison de chaque, + la combinaison possible entre les 2
# trois éléments candidats

RSpec.describe GardeRobe do
  context "avec une largeur de garde-robe de 250cm" do
    it "renvoie une liste vide quand aucun élément à ajouter à l'intérieur" do
      garde_robe = GardeRobe.new(250)
      aucun_element = []

      expect(garde_robe.combinaisons(aucun_element)).to eq([])
    end

    it "renvoie une liste de 5 éléments de 50cm quand des éléments de 50cm sont disponibles" do
      garde_robe = GardeRobe.new(250)
      element_de_50cm = [50]
      cinq_fois_cet_element = [[50, 50, 50, 50, 50]]

      expect(garde_robe.combinaisons(element_de_50cm)).to eq(cinq_fois_cet_element)
    end

    it "renvoie toutes les combinaisons d'un même rangement s'il peut remplir la garde-robe" do
      garde_robe = GardeRobe.new(250)
      elements_eligibles = [50, 250, 25]
      attendu = [[50, 50, 50, 50, 50], [250], [25, 25, 25, 25, 25, 25, 25, 25, 25, 25]]

      expect(garde_robe.combinaisons(elements_eligibles)).to eq(attendu)
    end
  end
end
