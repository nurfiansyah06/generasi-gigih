class Item
    attr_reader :id, :name, :price, :category, :category_id

    def initialize(id,name, price, category=nil, category_id=nil)
        @id=id
        @category=category
        @category_id=category_id
        @price=price
        @name=name
    end
    
end