require 'mysql2'
require_relative 'item'
require_relative 'category'

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "vianos",
        :password => "root",
        :database => "food"
    )
    client
end

def get_all_items 
    client = create_db_client
    rawData = client.query("SELECT * FROM items")
    items = Array.new
    rawData.each do |data|
        item = Item.new(data["id"],data["name"], data["price"])
        items.push(item)
    end
    items
end

def get_all_categories
    client = create_db_client
    rawData = client.query("SELECT * FROM categories")
    categories = Array.new
    rawData.each do |data|
        category = Category.new(data["id"],data["name"])
        categories.push(category)
    end
    categories
end

def get_all_item_categories
    client = create_db_client
    rawData = client.query("SELECT items.id,items.name,items.price,categories.id as 'category id', categories.name as 'category name' FROM items 
        JOIN item_categories ON items.id = item_categories.item_id
        JOIN categories ON categories.id = item_categories.category_id")
    item_with_categories = Array.new
    rawData.each do |data|
        category = Item.new(data["id"],data["name"], data["price"],data["category name"])
        item_with_categories.push(category)
    end
    item_with_categories
end

def insert_item(name, price)
    client = create_db_client
    client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}')")
end

def insert_item_categories(name, price, category_id)
    client = create_db_client
    client.query("INSERT INTO items (name, price) VALUES ('#{name}', '#{price}')")
    id = client.last_id
    client.query("INSERT INTO item_categories (item_id, category_id) VALUES ('#{id}', '#{category_id}')")
end

def update_item_categories(name, price, item_id, category_id)
    client = create_db_client
    client.query("UPDATE items SET name='#{name}', price='#{price}' WHERE id='#{item_id}'")
    client.query("UPDATE item_categories SET item_id='#{item_id}', category_id='#{category_id}' WHERE item_id='#{item_id}'")
end

def detail_item(id)
    client = create_db_client
    rawData = client.query("SELECT items.id,items.name,items.price,categories.id as 'category id', categories.name as 'category name' FROM items 
        JOIN item_categories ON items.id = item_categories.item_id
        JOIN categories ON categories.id = item_categories.category_id WHERE items.id = '#{id}'")
    detail_data = Array.new
    rawData.each do |data|
        detail = Item.new(data["id"],data["name"], data["price"],data["category name"], data["category id"])
        detail_data.push(detail)
    end
    detail_data
end

def delete_item(id)
    client = create_db_client
    client.query("DELETE FROM items WHERE id='#{id}'")
end

# puts("======== all items ========")
# items = get_all_items()
# puts(items.each)

# puts("======== categories ========")
# items = get_all_categories()
# puts(items.each)

# puts("======== item categories ========")
# item_categories = get_all_item_categories()
# puts(item_categories.each)


# puts("======== item_cheaper ========")
# puts("Enter the price :")
# items_cheaper = get_items_cheaper(gets.chomp)
# puts(items_cheaper.each)
