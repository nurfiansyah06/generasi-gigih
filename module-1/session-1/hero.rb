require_relative 'person'

class Hero < Person
    def initialize(name, hitpoint, attack_damage)
        super(name, hitpoint, attack_damage)
        @deflect_percentage = 8
    end

    def take_damage(damage)
        if rand(0..10) <= @deflect_percentage
            puts "#{@name} deflects the attacks."
        end
    end
end