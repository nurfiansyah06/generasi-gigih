require_relative 'person'
require_relative 'hero'
require_relative 'm'

jin = Person.new("Jin Sakai", 100, 50)
puts jin

khotun = Person.new("Khotun Khan", 500, 50)
puts khotun


loop do
    jin.attack(khotun)
    break if khotun.is_dead?

    khotun.attack(jin)

    break if jin.is_dead?
end

i = 1

until (jin.die? || villain.empty?) do
    puts "============ Turn #{i} =============="
    puts "\n"

    puts jin

    villains.Each do |villain|
        puts villain
    end
    puts "\n"

    jin.attack(villains[rand(villains.size)])

    villains.Each do |villain|
        villains.delete(villain) if villain.die? || villain.flee?
    end
    puts "\n"

    villains.Each do |villain|
        villain.attack(jin)
    end
    puts "\n"

    i += 1
end