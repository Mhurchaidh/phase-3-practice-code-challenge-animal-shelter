class Adopter < ActiveRecord::Base
    has_many :pets
    has_many :shelters

    def full_name
        self.first_name + " " + self.last_name
    end

    def adopt pet
        pet.update(adopted?: true, adopter_id: self.id)
    end

    def fav_pet
        best_pet = pets.max_by do |p| p.species end
        best_pet ? best_pet.species : nil
    end
end
