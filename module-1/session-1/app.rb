require_relative 'person'
require_relative 'hero'

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