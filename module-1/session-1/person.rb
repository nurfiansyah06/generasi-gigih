class Person 
    attr_reader :name, :hitpoint, :attack_damage

    def initialize(name, hitpoint, attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def to_s
        "#{@name} has #{@hitpoint} hitpoint and #{@attack_damage} attack damage"
    end

    def attack(other_person)
        other_person.take_damage(@attack_damage)

        puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        puts "#{other_person.name} has #{other_person.hitpoint} hitpoint and #{other_person.attack_damage} damage"
    end

    def take_damage(damage)
        @hitpoint -= damage
    end

    def is_dead?
        if @hitpoint <= 0
            puts "#{@name} dies"
            true
        end
    end

    def jin_deflect(damage)
        other_person.take_damage(@attack_damage)
        puts "Jin Sakai deflects the attacks."
    end
end
