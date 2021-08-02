require_relative '../models/item'

class ItemController
    def list_items
        items = Item.get_all_items
        renderer = ERB.new(File.read("views/index.erb"))
        renderer.result(binding)
    end
end