class Pet < ActiveRecord::Base
    belongs_to :shelter
    belongs_to :adopter

    def self.oldest
        self.all.max_by do |p| p.age end
    end

    def self.average_age
        self.average(:age).to_f
    end

    def in_dog_years
        self.age * 5
    end
end
